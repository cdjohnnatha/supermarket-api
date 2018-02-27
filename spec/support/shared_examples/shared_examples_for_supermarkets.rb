# frozen_string_literal: true

RSpec.shared_examples "a supermarket attributes" do
  it "should be returns a supermarket attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["name"]).to eq(attrs["supermarket"]["name"])
    expect(json["data"]["attributes"]["description"]).to eq(attrs["supermarket"]["description"])
  end
end