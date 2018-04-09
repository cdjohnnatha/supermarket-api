# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::SupermarketProductsController, type: :routing do

  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/supermarkets/1/products").to route_to("api/v1/supermarket_products#index", supermarket_id: "1")
    end

    it "routes to #show" do
      expect(get: "/v1/supermarkets/1/products/1").to route_to("api/v1/supermarket_products#show", supermarket_id: "1", id: "1")
    end

    it "routes to #create" do
     expect(post: "/v1/supermarkets/1/products").to route_to("api/v1/supermarket_products#create", supermarket_id: "1")
   end

    it "routes to #update via PUT" do
      expect(put: "/v1/supermarkets/1/products/1").to route_to("api/v1/supermarket_products#update", supermarket_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/supermarkets/1/products/1").to route_to("api/v1/supermarket_products#update", supermarket_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/v1/supermarkets/1/products/1").to route_to("api/v1/supermarket_products#destroy", supermarket_id: "1", id: "1")
    end
  end
end
