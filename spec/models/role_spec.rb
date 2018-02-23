# frozen_string_literal: true

require "rails_helper"

RSpec.describe Role, type: :model do
  it "should have a valid factory" do
    expect(build(:role)).to be_valid
  end

  describe "validations" do
    context "should require presence" do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end
  end

  context "relationships" do
    it { should have_and_belong_to_many(:users) }
  end
end
