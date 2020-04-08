Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :talks, only: [:index, :create]
  resources :videos, only: [:show]

  get '/lineup' => 'lineup#show'
  get '/sponsoring' => 'sponsoring#show'

  root to: 'homepage#show'
end
