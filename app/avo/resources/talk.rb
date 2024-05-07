class Avo::Resources::Talk < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :emoji, as: :text, hide_on: [ :forms ]
    field :title, as: :text, hide_on: [ :index ]
    field :title, as: :text, only_on: [ :index ], format_using: -> { value&.truncate(40) }
    field :speaker_name, as: :text, only_on: [ :index ], format_using: -> { value&.truncate(30) }
    field :speaker_name, as: :text, hide_on: [ :index ]
    field :speaker_email, as: :text, hide_on: [ :index ]
    field :speaker_twitter, as: :text, hide_on: [ :index ]
    field :level, as: :select, hide_on: [ :index ], enum: Talk.level.values
    field :duration, as: :select, only_on: [ :forms ], enum: Talk.duration.values
    field :priority, as: :select, enum: Talk.priority.values
    field :preferred_month_talk, as: :select, enum: Talk.propose_upcoming_months
    field :happened_at, as: :date, hide_on: [ :index ]
    field :slides, as: :text, hide_on: [ :index ]
    field :video_url, as: :text, hide_on: [ :index ]
    field :time_position, as: :date_time, hide_on: [ :index ]
  end
end
