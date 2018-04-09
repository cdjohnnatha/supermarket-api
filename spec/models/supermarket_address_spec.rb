# frozen_string_literal: true

require "rails_helper"

RSpec.describe SupermarketAddress, type: :model do
  it "should have a valid factory" do
   expect(build(:supermarket_address, :with_supermarket)).to be_valid
 end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { should validate_presence_of(:lat) }
      it { should validate_presence_of(:lng) }
      it { should validate_presence_of(:street_number) }
      it { should validate_presence_of(:street_name) }
      it { should validate_presence_of(:neighborhood) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:zip) }
      it { should validate_presence_of(:country) }
      it { should validate_presence_of(:supermarket_id) }
    end

    context "relationships" do
      it { should belong_to(:supermarket) }
    end
  end
end
