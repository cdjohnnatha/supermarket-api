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
  end
end
