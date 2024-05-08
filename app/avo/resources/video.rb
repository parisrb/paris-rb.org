class Avo::Resources::Video < Avo::BaseResource
  self.includes = []
  self.search = {
    query: -> { query.ransack(id_eq: params[:q], title_cont: params[:q], m: "or").result(distinct: true) }
  }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :vimeo_thumbnail, as: :text, as_html: true, hide_on: [:forms] do
      "<img src='#{record.vimeo_thumbnail}' width='100' />"
    end
    field :vimeo_url, as: :text, hide_on: [ :index ]
    field :description, as: :textarea, hide_on: [ :index ]
    field :event_date, as: :date
    field :slug, as: :text, hide_on: [ :index ]
  end
end
