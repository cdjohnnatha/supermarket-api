# frozen_string_literal: true

class SupermarketProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :price
  belongs_to :product
end
