Rails.application.routes.draw do
  devise_for :users
  resources :species
  root 'home#index'
end
