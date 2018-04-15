# frozen_string_literal: true

class SupermarketProductSerializer
  include FastJsonapi::ObjectSerializer
  attribute :price
  belongs_to :product
end
