# frozen_string_literal: true

class SupermarketProductPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :price, :created_at
end
