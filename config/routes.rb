Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks do
  post :confirm, on: :collection
  end
  resources :users, only: [:new, :create, :show, :edit]
  root to: 'users#new'
end
