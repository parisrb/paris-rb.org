Rails.application.routes.draw do
  devise_for :users

  resources :videos, only: [ :index, :show ]
  resources :talks, only: [ :index, :create ]
  resource :lineup, only: [ :show ]

  get "/communique_2022" => "welcome#communique"

  root to: "welcome#index"
end
