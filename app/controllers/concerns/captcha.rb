module Captcha
  extend ActiveSupport::Concern

  included do
    class_attribute :captcha_actions, default: []
    class_attribute :honeypot_field_name, default: "color"

    before_action :verify_honeypot, if: :action_enforced?
  end

  class_methods do
    def protect_from_spam_with_honeypot(options = {})
      self.captcha_actions = Array(options[:only])
      self.honeypot_field_name = options[:field_name].to_s if options[:field_name].present?
    end
  end

  private

  def verify_honeypot
    redirect_to root_path unless honeypot_empty?
  end

  def honeypot_empty?
    honeypot_value.blank?
  end

  def honeypot_value
    params[honeypot_field_name]
  end

  def action_enforced?
    captcha_actions.include?(action_name.to_sym)
  end
end
