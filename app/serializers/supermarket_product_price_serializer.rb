# frozen_string_literal: true

class SupermarketProductPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :created_at
end
