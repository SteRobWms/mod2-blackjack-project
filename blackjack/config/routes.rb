Rails.application.routes.draw do
  get 'sessions/new'
  get "/login", to: "sessions#create"
  get "/register", to: "players#new"
  post "/resiter", to: "players#create"

  resources :players, only: [:show, :edit, :update]
  resources :games, only: [:new, :create, :show]
end
