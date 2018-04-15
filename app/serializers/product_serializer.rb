# frozen_string_literal: true

class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :barcode, :brand, :quantity, :unit_measure
end
