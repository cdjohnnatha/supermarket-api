# frozen_string_literal: true

RSpec.shared_examples "a supermarket address attributes" do
  it "should be returns an address attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["lat"]).to eq(attrs["supermarket_address"]["lat"])
    expect(json["data"]["attributes"]["lng"]).to eq(attrs["supermarket_address"]["lng"])
    expect(json["data"]["attributes"]["street_number"]).to eq(attrs["supermarket_address"]["street_number"])
    expect(json["data"]["attributes"]["street_name"]).to eq(attrs["supermarket_address"]["street_name"])
    expect(json["data"]["attributes"]["neighborhood"]).to eq(attrs["supermarket_address"]["neighborhood"])
    expect(json["data"]["attributes"]["city"]).to eq(attrs["supermarket_address"]["city"])
    expect(json["data"]["attributes"]["state"]).to eq(attrs["supermarket_address"]["state"])
    expect(json["data"]["attributes"]["zip"]).to eq(attrs["supermarket_address"]["zip"])
    expect(json["data"]["attributes"]["country"]).to eq(attrs["supermarket_address"]["country"])
    expect(json["data"]["attributes"]["country"]).to eq(attrs["supermarket_address"]["country"])
  end
end
