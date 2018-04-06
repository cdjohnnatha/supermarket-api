# frozen_string_literal: true

FactoryBot.define do
  factory :supermarket_address do
    lat "9.99"
    lng "9.99"
    street_number "MyString"
    street_name "MyString"
    neighborhood "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    country "MyString"
    place_id "MyString"
  end
end
