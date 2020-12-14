Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :species do
    resources :comments

    member do
      get 'versions'
    end
  end

  root 'home#index'
end
