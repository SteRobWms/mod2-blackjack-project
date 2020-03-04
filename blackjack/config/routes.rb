Rails.application.routes.draw do
  get 'sessions/new'
  get "/login", to: "sessions#create"
  get "/register", to: "players#new"
  post "/resiter", to: "players#create"

  resources :player_hands, only: [:update]
  resources :player_hand_cards, only: [:update]
  resources :dealer_hands, only: [:update]
  resources :dealer_hand_cards, only: [:update]
  resources :players, only: [:show, :edit, :update]
  resources :games, only: [:new, :create, :show, :edit, :update]
end
