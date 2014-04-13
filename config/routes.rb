Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :videos, only: [:index, :show]
  resources :talks, only: [:index, :create]

  root to: 'welcome#index'
end
