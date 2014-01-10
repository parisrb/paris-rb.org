class VideosController < ApplicationController
  expose(:videos) do |default|
    default.order(event_date: :desc).page(params[:page])
  end
  expose(:video)
end
