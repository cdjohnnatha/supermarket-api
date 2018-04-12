# frozen_string_literal: true

FactoryBot.define do
  factory :supermarket_product do
    product_id { create(:product).id }

    trait :with_supermarket do
      supermarket_id { create(:supermarket).id }
    end

    trait :with_price do
      supermarket_product_prices_attributes { [ attributes_for(:supermarket_product_price) ] }
    end
  end
end
