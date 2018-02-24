# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name Faker::Name.name
    email { Faker::Internet::email }
    password Faker::Internet::password(8)

    trait :with_admin_role do
      after(:create) do |user|
        user.roles << create(:role, :admin)
      end
    end
  end
end
