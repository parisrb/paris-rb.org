class Avo::Resources::Sponsor < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :website, as: :text, html: true, format_using: -> { value&.truncate(50) }
    field :from, as: :date_time, hide_on: [ :index ]
    field :until, as: :date_time, hide_on: [ :index ]
    field :logo, as: :file, is_image: true
  end
end
