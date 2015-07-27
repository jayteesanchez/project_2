Rails.application.routes.draw do

  get 'sessions/new'

  root 'shoes#index'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  resources :users
  resources :shoes
end
