Rails.application.routes.draw do
  resources :players, only: [:show, :edit, :update]
  resources :games, only: [:new, :create, :show]
end
