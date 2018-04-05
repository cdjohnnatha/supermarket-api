# frozen_string_literal: true

class SupermarketProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :price, :quantity
  belongs_to :product
end
