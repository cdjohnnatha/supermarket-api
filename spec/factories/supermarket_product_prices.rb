# frozen_string_literal: true

FactoryBot.define do
  factory :supermarket_product_price do
    price Faker::Number.decimal(2)
  end
end
