Rails.application.routes.draw do

  root 'welcome#index'

  resources :tasks
  delete 'destroy', to: 'tasks#destroy_completed'

  resources :users, only: [:edit, :show, :update, :create]
  get 'registration', to: 'users#new'

  resources :sessions, only: [:create]
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

end
