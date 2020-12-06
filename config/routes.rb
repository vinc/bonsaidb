Rails.application.routes.draw do
  resources :species
  root 'home#index'
end
