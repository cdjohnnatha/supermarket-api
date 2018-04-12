# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name Faker::DragonBall.character
    description Faker::Lorem.sentence
    barcode { Faker::Bitcoin.address }
    brand Faker::Lorem.word
    quantity Faker::Number.number(3)
    unit_measure Faker::Lorem.characters(3)
  end
end
