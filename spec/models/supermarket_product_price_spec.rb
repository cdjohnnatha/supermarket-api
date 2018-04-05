# frozen_string_literal: true

require "rails_helper"

RSpec.describe SupermarketProductPrice, type: :model do
  it "should have a valid factory" do
    ap expect(build(:price)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { should validate_presence_of(:price) }
    end
  end

  describe "Active Records associations" do
    context "relationships" do
      it { should belong_to(:supermarket) }
      it { should belong_to(:product) }
    end
  end
end
