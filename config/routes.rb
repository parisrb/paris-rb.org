Rails.application.routes.draw do
  # static pages
  sitepress_pages

  devise_for :users
  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  resources :videos, only: [ :index, :show ]
  resources :talks, only: [ :new, :index, :create ]
  resource :lineup, only: [ :show ]
  resources :sponsors, only: [ :index ]
  resource :locale, only: [ :update ]

  get "/communique_2022" => redirect("/communiques/thibault_assus_comdamnation", status: 301)
  get "/redirection/slack" => redirect(JOIN_SLACK_URL, status: 308)

  root to: "welcome#index"
end
