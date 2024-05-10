class VideosController < ApplicationController
  def index
    @search = Video.ransack(params[:q])
    @videos = @search.result(distinct: true).chronologically.page(params[:page])
  end

  def show
    @video = Video.where(slug: params[:id]).first
  end
end
