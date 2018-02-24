# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Supermarkets", type: :request do
  let(:valid_attrs) { supermarket: { attributes_for(:supermarket) }.as_json }
  let(:invalid_attrs) { supermarket: { attributes_for(:supermarket, name: nil) } }

  describe "/v1/supermarkets" do
    context "GET" do
      before { create_list(:supermarket, 3) }
    end
  end
end