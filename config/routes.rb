Rails.application.routes.draw do
  get 'sessions/new'
  resources :tasks
  resources :users, only: [:new, :create, :show]
  root to: 'tasks#index'
end
