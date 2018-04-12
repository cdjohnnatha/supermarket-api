# frozen_string_literal: true

RSpec.shared_examples "a supermarket product attributes" do
  it "should be returns a supermarket product attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]).to have_key("price")
    expect(json["data"]["attributes"]["price"]["price"]).to eq(attrs[:supermarket_product]["supermarket_product_prices_attributes"].first["price"].to_f)
  end
end
