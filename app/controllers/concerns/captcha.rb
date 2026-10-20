module Captcha
  extend ActiveSupport::Concern

  # Nom du champ caché qui porte le stamp signé, et du message verifier qui le
  # signe.
  STAMP_FIELD_NAME = "form_stamp"

  # Un formulaire rempli plus vite que ça ne l'a pas été par un humain.
  MIN_FILL_TIME = 3.seconds

  # Passé ce délai le stamp ne vaut plus rien. Sans borne, un stamp récupéré
  # une seule fois se rejoue indéfiniment et redevient une simple constante.
  MAX_FORM_AGE = 24.hours

  included do
    class_attribute :captcha_actions, default: []
    class_attribute :honeypot_field_name, default: "color"
    class_attribute :expired_form_action, default: nil

    before_action :verify_captcha, if: :action_enforced?

    helper_method :captcha_form_stamp
  end

  class_methods do
    def protect_from_spam_with_honeypot(options = {})
      self.captcha_actions = Array(options[:only])
      self.honeypot_field_name = options[:field_name].to_s if options[:field_name].present?
      self.expired_form_action = options[:on_expired_form]
    end
  end

  private

  # Preuve signée que le formulaire vient bien de chez nous, et de l'heure à
  # laquelle il a été rendu. La plupart des bots ne le chargent jamais : ils
  # postent directement sur l'endpoint avec les params récupérés une fois pour
  # toutes, et n'ont donc aucun stamp à renvoyer.
  def captcha_form_stamp
    @captcha_form_stamp ||= reusable_stamp || generate_stamp
  end

  # Quand une soumission revient sur une erreur de validation, on réutilise le
  # stamp reçu : quelqu'un qui corrige une typo et renvoie dans la foulée n'est
  # pas un bot. Un stamp périmé, lui, ne repart jamais dans le formulaire, il
  # enverrait la personne dans une boucle de rejets.
  def reusable_stamp
    submitted_stamp if stamp_age && stamp_age <= MAX_FORM_AGE
  end

  def generate_stamp
    stamp_verifier.generate(Time.current.to_i)
  end

  # Secondes écoulées depuis le rendu du formulaire, ou nil quand le stamp est
  # absent ou n'a pas été signé par nous.
  def stamp_age
    return @stamp_age if defined?(@stamp_age)

    issued_at = stamp_verifier.verified(submitted_stamp)
    @stamp_age = (Time.current.to_i - issued_at if issued_at.is_a?(Integer))
  end

  # Autre chose qu'une chaîne ici (`form_stamp[]=x`), c'est qu'on nous cherche.
  def submitted_stamp
    stamp = params[STAMP_FIELD_NAME]
    stamp if stamp.is_a?(String)
  end

  def stamp_verifier
    Rails.application.message_verifier(STAMP_FIELD_NAME)
  end

  def verify_captcha
    reason = spam_reason
    return if reason.nil?

    log_spam(reason)

    # Le stamp périmé est le seul rejet qu'un humain peut déclencher. Le
    # contrôleur a donc l'occasion de lui rendre son formulaire plutôt que de
    # le renvoyer à l'accueil avec sa proposition perdue.
    if reason == :expired_form && expired_form_action
      send(expired_form_action)
    else
      redirect_to root_path
    end
  end

  def spam_reason
    if honeypot_value.present?
      :honeypot_filled
    elsif stamp_age.nil?
      :never_fetched
    elsif stamp_age < MIN_FILL_TIME
      :too_fast
    elsif stamp_age > MAX_FORM_AGE
      :expired_form
    end
  end

  def honeypot_value
    params[honeypot_field_name]
  end

  # Jeter les soumissions en silence empêche de savoir si tout ça marche
  # encore, ou si ça s'est mis à manger de vraies propositions.
  def log_spam(reason)
    Rails.logger.warn(
      "[Captcha] Blocked #{controller_name}##{action_name}: #{reason} " \
      "(age=#{stamp_age.inspect} ip=#{request.remote_ip} user_agent=#{request.user_agent.inspect})"
    )
  end

  def action_enforced?
    captcha_actions.include?(action_name.to_sym)
  end
end
