# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :supermarkets

  validates :name, presence: true
  validates :description, presence: false
  validates :barcode, presence: true
  validates :brand, presence: true
  validates :quantity, presence: true
end
