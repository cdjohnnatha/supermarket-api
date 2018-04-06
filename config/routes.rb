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
      resources :supermarkets do
        resources :products, controller: :supermarket_products
        resources :address, except: [:show], controller: :supermarket_address
      end

      resources :products
      get "/products/barcode/:barcode", to: "products#barcode", as: "product_barcode"
      
    end
  end
end
