Rails.application.routes.draw do
  resources :tasks
  resources :users, only: [:new, :create, :show]
  root to: 'tasks#index'
end
