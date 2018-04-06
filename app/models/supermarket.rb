# frozen_string_literal: true

class Supermarket < ApplicationRecord
  has_many :supermarket_products
  has_many :products, through: :supermarket_products
  has_one :supermarket_address

  validates :name, presence: true
  validates :description, presence: false
end
