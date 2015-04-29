Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show]

  resources :pastries, only: [:index]

  resources :shops, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :pastries, except: [:index, :show]
  end


end