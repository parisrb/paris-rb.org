class LocalesController < ApplicationController
  def update
    redirect_back(fallback_location: root_path)
  end
end
