# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  it "should have a valid factory" do
    expect(build(:product)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:barcode) }
      it { should validate_presence_of(:brand) }
      it { should allow_value(nil).for(:description) }
    end

    context "relationships" do
      it { should have_many(:supermarket_products) }
      it { should have_many(:supermarkets).through(:supermarket_products) }
    end
  end
end
