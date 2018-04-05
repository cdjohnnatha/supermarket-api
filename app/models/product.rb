# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :supermarket_products
  has_many :supermarkets, through: :supermarket_product

  validates :name, presence: true
  validates :description, presence: false
  validates :barcode, presence: true
  validates :brand, presence: true
end
