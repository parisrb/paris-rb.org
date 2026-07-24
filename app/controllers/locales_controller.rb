class LocalesController < ApplicationController
  def update
    redirect_to referer.presence || root_path
  end

  def referer
    return if request.referer.blank?
    # Rails 8.1 raises PathRelativeRedirectError on redirects that are neither
    # absolute nor root-relative, and the Referer header is client controlled.
    return unless request.referer.match?(%r{\A(?:https?://|/)})

    # referer url without the locale params
    request.referer.gsub(/(\?|&)locale=[a-z]{2}/, "")
  end
end
