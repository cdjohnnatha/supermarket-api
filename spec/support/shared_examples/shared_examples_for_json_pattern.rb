# frozen_string_literal: true

RSpec.shared_examples "a json pattern" do
  it "should be returns json pattern" do
    expect(json).not_to be_blank
    expect(json).not_to be_empty
    expect(json).to have_key("data")
    expect(json["data"]).to have_key("id")
    expect(json["data"]).to have_key("type")
    expect(json["data"]).to have_key("attributes")
  end
end

RSpec.shared_examples "a json with relationship pattern" do
  it "should be returns json pattern" do
    expect(json).not_to be_blank
    expect(json).not_to be_empty
    expect(json).to have_key("data")
    expect(json["data"]).to have_key("id")
    expect(json["data"]).to have_key("type")
    expect(json["data"]).to have_key("attributes")
    expect(json["data"]).to have_key("relationships")
  end
end

RSpec.shared_examples "a json with relationship included pattern" do
  it "should be returns json pattern" do
    expect(json).not_to be_blank
    expect(json).not_to be_empty
    expect(json).to have_key("data")
    expect(json["data"]).to have_key("id")
    expect(json["data"]).to have_key("type")
    expect(json["data"]).to have_key("attributes")
    expect(json["data"]).to have_key("relationships")
    expect(json).to have_key("included")
  end
end
