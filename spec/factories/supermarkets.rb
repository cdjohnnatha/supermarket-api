# frozen_string_literal: true

FactoryBot.define do
  factory :supermarket do
    name Faker::DragonBall.character
    description Faker::Lorem.sentence
  end
end
