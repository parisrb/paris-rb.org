class Avo::Resources::User < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :email, as: :text
    field :password, as: :password, only_on: [ :new, :edit ]

    field :password_confirmation, as: :password, only_on: [ :new, :edit ], nullable: true
  end
end
