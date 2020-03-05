Rails.application.routes.draw do
  resources :player_hands, only: [:update]
  resources :player_hand_cards, only: [:update]
  resources :dealer_hands, only: [:update]
  resources :dealer_hand_cards, only: [:update]
  resources :players, only: [:show, :edit, :update]
  resources :games, only: [:new, :create, :show, :edit, :update]

  get "/", to: "application#login"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/register", to: "players#new", as: "register"
  post "/register", to: "players#create"
  get "/forgot_password", to: "passwords#edit", as: "forgot_password"
  patch "/forgot_password", to: "passwords#update"
  post "/player_hands/:id", to: "player_hands#stand", as: "stand"
end


