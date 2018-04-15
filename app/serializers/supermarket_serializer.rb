# frozen_string_literal: true

class SupermarketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
  has_one :supermarket_address
end
