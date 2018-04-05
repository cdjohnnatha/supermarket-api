# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name Faker::DragonBall.character
    description Faker::Lorem.sentence
    barcode Faker::Lorem.characters(20)
    brand Faker::Lorem.word
    quantity Faker::Number.digit
  end
end
