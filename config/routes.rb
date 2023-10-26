Rails.application.routes.draw do
  resources :estados
  resources :cidades

  get "up" => "rails/health#show", as: :rails_health_check

  # HOME
  root "home#index"
end
