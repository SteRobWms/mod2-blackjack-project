Rails.application.routes.draw do
  resources :players, only: [:edit, :update,:show]
  resources :games, only: [:new, :create, :show]

  get "/", to: "application#login"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/register", to: "players#new", as: "register"
  post "/register", to: "players#create"
  get "/forgot_password", to: "passwords#edit", as: "forgot_password"
  patch "/forgot_password", to: "passwords#update"
end


