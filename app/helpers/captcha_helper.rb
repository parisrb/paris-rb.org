module CaptchaHelper
  def captcha_field_tag
    safe_join([ honeypot_tag, form_stamp_tag ])
  end

  private

  # Les bots remplissent tous les champs qu'ils trouvent, les humains ne voient
  # jamais celui-ci. Il est sorti de l'ordre de tabulation et caché aux
  # gestionnaires de mots de passe pour qu'il ne soit pas rempli par accident.
  def honeypot_tag
    tag :input,
      type: "text",
      name: honeypot_field_name,
      id: honeypot_field_name,
      style: style,
      tabindex: -1,
      autocomplete: "off",
      aria: { hidden: true }
  end

  def form_stamp_tag
    hidden_field_tag Captcha::STAMP_FIELD_NAME, captcha_form_stamp, id: nil
  end

  def honeypot_field_name
    controller.class.honeypot_field_name
  end

  # Plusieurs façons de cacher le honeypot. Toutes le sortent du flux : un
  # champ de taille nulle resté dans le flux compte quand même comme flex item
  # et ajoute un gap à la rangée où il se trouve.
  def style
    [
      "display:none;",
      "visibility:hidden; position:absolute;",
      "position:absolute; top:-9999px; left:-9999px;",
      "position:absolute; height:0; width:0; opacity:0;"
    ].sample
  end
end
