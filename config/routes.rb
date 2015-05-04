Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show]

  resources :pastries, only: [:index]

  resources :pastries, only: [] do
    member do
      delete "remove", to: "shopping_cart_items#destroy", as: :remove_from_cart
      post "add", to: "shopping_cart_items#create", as: :add_to_cart
    end
  end

  resources :shops, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :pastries, except: [:index, :show]
  end


end