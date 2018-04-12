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
        # create a product and add into supermarket_product
        post "/products/create-add", to: "supermarket_products#create_and_add", as: "create_and_add"
        resources :products, except: [:update], controller: :supermarket_products do
          post "/prices/date-range", to: "supermarket_product_prices#range", as: "prices_range"
          resources :prices, controller: :supermarket_product_prices
        end
        resources :address, except: [:show], controller: :supermarket_address
      end

      resources :products

      #search products by barcode
      get "/products/barcode/:barcode", to: "products#barcode", as: "product_barcode"
    end
  end
end
