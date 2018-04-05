# frozen_string_literal: true

RSpec.shared_examples "a product attributes" do
  it "should be returns a product attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["name"]).to eq(attrs["product"]["name"])
    expect(json["data"]["attributes"]["description"]).to eq(attrs["product"]["description"])
    expect(json["data"]["attributes"]["barcode"]).to eq(attrs["product"]["barcode"])
    expect(json["data"]["attributes"]["brand"]).to eq(attrs["product"]["brand"])
    expect(json["data"]["attributes"]["quantity"]).to eq(attrs["product"]["quantity"].to_i)
  end
end
