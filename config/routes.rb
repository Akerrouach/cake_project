Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations" }

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

  resources :shopping_carts do
    collection do
      get 'orders_sent', to: "shopping_carts#orders_sent"
      get 'orders_received', to: "shopping_carts#orders_received"
    end
    member do
      post "validate", to: "shopping_carts#validate", as: :validate_cart
      post "accept", to: "shopping_carts#accept", as: :accept_cart
      post "decline", to: "shopping_carts#decline", as: :decline_cart
    end
  end

  resources :shopping_carts, only: :update


end