class VideosController < ApplicationController
  expose(:search) { Video.search(params[:q]) }
  expose(:video)
  expose(:videos) do |default|
    search.result(distinct: true)
          .order(event_date: :desc)
          .page(params[:page])
  end
end
