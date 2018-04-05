# frozen_string_literal: true

require "rails_helper"
require "cancan/matchers"

RSpec.describe User, type: :model do
  it "should have a valid factory" do
    ap expect(build(:user)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
      it { should have_secure_password }
      describe "when email format is valid" do
        it "should be valid" do
          emails = ["user@foo.COM", "A_US-ER@f.b.org", "frst.lst@foo.jp", "a+b@baz.cn"]
          emails.each do |valid_email|
            expect(valid_email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
            expect(build(:user, email: valid_email)).to be_valid
          end
        end
      end
    end
  end

  describe "Active Records associations" do
    context "relationships" do
      it { should have_and_belong_to_many(:roles) }
    end
  end
end
