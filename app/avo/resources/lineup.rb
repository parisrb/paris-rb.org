class Avo::Resources::Lineup < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :emoji, as: :text, hide_on: [ :forms ]
    field :title, as: :text
    field :speaker_name, as: :text
    field :speaker_email, as: :text, hide_on: [ :index ]
    field :level, as: :text, hide_on: [ :index ]
    field :duration, as: :text
    field :happened_at, as: :date, hide_on: [ :index ]
    field :slides, as: :text, hide_on: [ :index ]
    field :video_url, as: :text, hide_on: [ :index ]
    field :speaker_twitter, as: :text, hide_on: [ :index ]
    field :preferred_month_talk, as: :text
    field :time_position, as: :date_time, hide_on: [ :index ]
    field :priority, as: :text, hide_on: [ :index ]
  end
end
