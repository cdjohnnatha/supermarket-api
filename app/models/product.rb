# frozen_string_literal: true

# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :supermarket_products
  has_many :supermarkets, through: :supermarket_products

  validates :name, presence: true
  validates :description, presence: false
  validates :barcode, presence: true
  validates :brand, presence: true
end
