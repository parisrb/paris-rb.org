Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  resources :videos, only: [ :index, :show ]
  resources :talks, only: [ :index, :create ]

  get "/lineup" => "lineup#show"
  get "/communique_2022" => "welcome#communique"

  root to: "welcome#index"
end
