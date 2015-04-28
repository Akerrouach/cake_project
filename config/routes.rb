Rails.application.routes.draw do

 # root to: "home#index"

 devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show]

  resources :shops, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :pastries, only: [:show, :create, :new, :edit, :update, :destroy]
      collection do
          get 'result', to: "pastries#result_shops"
        end
  end




end