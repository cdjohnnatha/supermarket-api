# frozen_string_literal: true

class SupermarketProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :price, :quantity, :unit_measure
  belongs_to :product
end
