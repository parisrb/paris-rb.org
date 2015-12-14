Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :videos, only: [:index, :show]
  resources :talks, only: [:index, :create, :sort]
  resources :talks do
    collection { post :sort }
  end

  get '/lineup' => 'lineup#show'

  root to: 'welcome#index'
end
