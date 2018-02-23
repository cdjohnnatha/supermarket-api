# frozen_string_literal: true

RSpec.shared_examples "a user with roles attributes" do
  it "should be returns a user with roles attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["name"]).to eq(attrs["user"]["name"])
    expect(json["data"]["attributes"]["email"]).to eq(attrs["user"]["email"])
    expect(json["data"]["relationships"]).not_to be_empty 
    expect(json["data"]["relationships"]).to have_key("roles") 
  end
end