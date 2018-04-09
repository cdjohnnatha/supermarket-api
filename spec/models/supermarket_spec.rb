# frozen_string_literal: true

require "rails_helper"

RSpec.describe Supermarket, type: :model do
  it "should have a valid factory" do
    expect(build(:supermarket)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { should validate_presence_of(:name) }
    end
  end

  describe "Active Records associations" do
    context "relationships" do
      it { should have_many(:supermarket_products) }
      it { should have_many(:products).through(:supermarket_products) }
      it { should have_one(:supermarket_address) }
    end
  end
end
