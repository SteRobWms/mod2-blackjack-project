Rails.application.routes.draw do
  resources :players, only: [:show, :edit, :update]
end
