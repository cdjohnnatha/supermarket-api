# frozen_string_literal: true

require "rails_helper"

RSpec.describe SupermarketProductPrice, type: :model do
  it "should have a valid factory" do
    expect(build(:supermarket_product_price)).to be_valid
  end

  describe "ActiveModel validations" do
     context "should require presence" do
      it { should validate_presence_of(:price) }
    end

    context "relationships" do
      it { should belong_to(:supermarket_product) }
    end
  end
end
