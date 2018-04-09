FactoryBot.define do
  factory :supermarket_product do
    product_id { create(:product).id }
    price Faker::Number.decimal(2,3)
    quantity Faker::Number.number(3)
    unit_measure Faker::Lorem.characters(3)
    
    trait :with_supermarket do
      supermarket_id { create(:supermarket).id }
    end
  end
end
