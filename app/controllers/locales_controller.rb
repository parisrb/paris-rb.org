class LocalesController < ApplicationController
  def update
    redirect_to referer.presence || root_path
  end

  def referer
    # referer url without the locale params
    request.referer.gsub(/(\?|&)locale=[a-z]{2}/, '') if request.referer
  end
end
