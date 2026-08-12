module Captcha
  extend ActiveSupport::Concern

  # Name of the hidden field carrying the signed stamp, and of the message
  # verifier used to sign it.
  STAMP_FIELD_NAME = "form_stamp"

  # A form filled in faster than this was not filled in by a human.
  MIN_FILL_TIME = 3.seconds

  included do
    class_attribute :captcha_actions, default: []
    class_attribute :honeypot_field_name, default: "color"

    before_action :verify_captcha, if: :action_enforced?

    helper_method :captcha_form_stamp
  end

  class_methods do
    def protect_from_spam_with_honeypot(options = {})
      self.captcha_actions = Array(options[:only])
      self.honeypot_field_name = options[:field_name].to_s if options[:field_name].present?
    end
  end

  private

  # Signed proof that we rendered the form, and when. Most spam never fetches
  # the form at all: it posts straight to the endpoint with the params it
  # harvested once, so it has no stamp to send back.
  #
  # When a submission bounces back on a validation error, the incoming stamp is
  # reused: someone fixing a typo and submitting again right away is not a bot.
  def captcha_form_stamp
    @captcha_form_stamp ||= stamp_age ? submitted_stamp : generate_stamp
  end

  def generate_stamp
    stamp_verifier.generate(Time.current.to_i)
  end

  # Seconds since the form was rendered, or nil when the stamp is missing or
  # was not signed by us.
  def stamp_age
    issued_at = stamp_verifier.verified(submitted_stamp)
    Time.current.to_i - issued_at if issued_at.is_a?(Integer)
  end

  # Anything but a string here (`form_stamp[]=x`) is someone poking at us.
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
    redirect_to root_path
  end

  def spam_reason
    age = stamp_age

    if honeypot_value.present?
      "honeypot field was filled in"
    elsif age.nil?
      "form was never fetched"
    elsif age < MIN_FILL_TIME
      "form was submitted in #{age}s"
    end
  end

  def honeypot_value
    params[honeypot_field_name]
  end

  # Silently dropping submissions makes it impossible to tell whether this
  # still works, or whether it started eating real proposals.
  def log_spam(reason)
    Rails.logger.warn(
      "[Captcha] Blocked #{controller_name}##{action_name}: #{reason} " \
      "(ip=#{request.remote_ip} user_agent=#{request.user_agent.inspect})"
    )
  end

  def action_enforced?
    captcha_actions.include?(action_name.to_sym)
  end
end
