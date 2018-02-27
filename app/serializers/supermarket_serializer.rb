# frozen_string_literal: true

class SupermarketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description
end
