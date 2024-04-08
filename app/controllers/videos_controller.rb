class VideosController < ApplicationController
  expose(:video) { Video.where(slug: params[:id]).first }

  def index
    @search = Video.ransack(params[:q])
    @videos = @search.result(distinct: true).order(event_date: :desc).page(params[:page])
  end

  def show
    @video = Video.where(slug: params[:id]).first
  end
end
