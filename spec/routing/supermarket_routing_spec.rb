# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::SupermarketsController, type: :routing do

  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/supermarkets").to route_to("api/v1/supermarkets#index")
    end

    it "routes to #show" do
      expect(get: "/v1/supermarkets/1").to route_to("api/v1/supermarkets#show", id: "1")
    end

    it "routes to #create" do
     expect(post: "/v1/supermarkets").to route_to("api/v1/supermarkets#create")
   end

    it "routes to #update via PUT" do
      expect(put: "/v1/supermarkets/1").to route_to("api/v1/supermarkets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/supermarkets/1").to route_to("api/v1/supermarkets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/v1/supermarkets/1").to route_to("api/v1/supermarkets#destroy", id: "1")
    end
  end
end
