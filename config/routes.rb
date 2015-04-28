Rails.application.routes.draw do

 # root to: "home#index"

 devise_for :users

  resources :users, only: [:show]

  resources :shops, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :pastries, only: [:show, :create, :new, :edit, :update, :destroy]
  end




end