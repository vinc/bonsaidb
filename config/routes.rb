Rails.application.routes.draw do
  devise_for :users

  resources :species do
    member do
      get 'versions'
    end
  end

  root 'home#index'
end
