# frozen_string_literal: true

require "rails_helper"

RSpec.describe SupermarketProduct, type: :model do
  it "should have a valid factory" do
    expect(build(:supermarket_product, :with_supermarket)).to be_valid
  end

  describe "ActiveModel validations" do
    context "relationships" do
       it { should belong_to(:product) }
      it { should belong_to(:supermarket) }
      it { should have_many(:supermarket_product_prices) }
    end
  end
end
