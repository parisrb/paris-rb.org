class VideosController < ApplicationController
  def show
    @video = Video.find_by(slug: params[:id])
  end
end
