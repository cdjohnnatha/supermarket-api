# frozen_string_literal: true

RSpec.shared_examples "a supermarket products attributes" do
  it "should be returns a supermarket products attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"].first["attributes"]["price"]).to eq(attrs[:supermarket_products].first["price"].to_f)
    expect(json["data"].first["attributes"]["quantity"]).to eq(attrs[:supermarket_products].first["quantity"].to_f)
    expect(json["data"].first["attributes"]["unit_measure"]).to eq(attrs[:supermarket_products].first["unit_measure"])
  end
end

RSpec.shared_examples "a supermarket product attributes" do
  it "should be returns a supermarket product attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["price"]).to eq(attrs[:supermarket_products]["price"].to_f)
    expect(json["data"]["attributes"]["quantity"]).to eq(attrs[:supermarket_products]["quantity"].to_f)
    expect(json["data"]["attributes"]["unit_measure"]).to eq(attrs[:supermarket_products]["unit_measure"])
  end
end
