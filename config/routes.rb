Rails.application.routes.draw do
  devise_for :users
  # authenticate :user, ->(u) { u.admin } do
  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  resources :videos, only: [ :index, :show ]
  resources :talks, only: [ :index, :create ]
  resource :lineup, only: [ :show ]

  get "/communique_2022" => "welcome#communique"

  root to: "welcome#index"
end
