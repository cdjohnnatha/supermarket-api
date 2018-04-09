require 'rails_helper'

RSpec.describe SupermarketProduct, type: :model do
  it "should have a valid factory" do
    expect(build(:supermarket_product)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:quantity) }
      it { should validate_presence_of(:unit_measure) }
    end

    context "relationships" do
      it { should belong_to(:product) }
      it { should belong_to(:supermarket) }
    end
  end
end
