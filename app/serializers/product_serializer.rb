# frozen_string_literal: true

class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :barcode, :brand
end
