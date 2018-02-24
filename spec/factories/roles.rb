# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Faker::Name.name }

    trait :newuser do
      name "user"
    end

    trait :admin do
      name "admin"
    end

    trait :with_users do
      after(:create) do |role|
        role.users = create_list(:user, 2)
      end
    end
  end
end
