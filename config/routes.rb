# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :api do
    
    namespace "v1" do
      # Authentication
      post "/user_token", to: "user_token#create", as: "user_token"

      #Documentation
      resources :docs, only: [:index]

      # Other resources
      resources :users
      resources :supermarkets

      resources :products
    end
  end
end
