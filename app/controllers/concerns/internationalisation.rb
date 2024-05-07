module Internationalisation
  extend ActiveSupport::Concern

  included do
    before_action :store_locale, :set_locale
    helper_method :current_locale
  end

  private

  def current_locale
    I18n.locale
  end

  def store_locale
    session[:locale] = params[:locale] if params[:locale]&.to_sym&.presence_in(I18n.available_locales)
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
