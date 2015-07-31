Rails.application.routes.draw do
  root 'shoes#index'
# routes for Logging in and out
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
# Nested the Shoe Routes
  resources :users do
    resources :shoes
  end

end
