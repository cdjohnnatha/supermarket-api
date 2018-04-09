FactoryBot.define do
  factory :supermarket_address do
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    street_number Faker::Address.building_number
    street_name Faker::Address.street_name
    neighborhood Faker::Address.community
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip
    country Faker::Address.country
    place_id Faker::Address.zip
    
    trait :with_supermarket do
      supermarket_id { create(:supermarket).id }
    end
  end
end
