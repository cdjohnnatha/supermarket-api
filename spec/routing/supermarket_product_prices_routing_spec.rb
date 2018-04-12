# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::SupermarketProductPricesController, type: :routing do

  describe "routing" do
    it "routes to #index" do
      expect(get: "/v1/supermarkets/1/products/1/prices/").to route_to("api/v1/supermarket_product_prices#index", supermarket_id: "1", product_id: "1")
    end

    it "routes to #show" do
      expect(get: "/v1/supermarkets/1/products/1/prices/1").to route_to("api/v1/supermarket_product_prices#show", supermarket_id: "1", product_id: "1", id: "1")
    end

    it "routes to #create" do
     expect(post: "/v1/supermarkets/1/products/1/prices/").to route_to("api/v1/supermarket_product_prices#create")
   end

    it "routes to #update via PUT" do
      expect(put: "/v1/supermarkets/1/products/1/prices/1").to route_to("api/v1/supermarket_product_prices#update", supermarket_id: "1", product_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/supermarkets/1/products/1/prices/1").to route_to("api/v1/supermarket_product_prices#update", supermarket_id: "1", product_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/v1/supermarkets/1/products/1/prices/1").to route_to("api/v1/supermarket_product_prices#destroy", supermarket_id: "1", product_id: "1", id: "1")
    end

    it "routes to #range" do
      expect(post: "/v1/supermarkets/1/products/1/prices/date-range").to route_to("api/v1/supermarket_product_prices#range", supermarket_id: "1", product_id: "1")
    end
  end
end
