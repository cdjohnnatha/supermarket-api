# frozen_string_literal: true

class SupermarketProduct < ApplicationRecord
  belongs_to :supermarket
  belongs_to :product

  validates :price, presence: true
  validates :quantity, presence: true
end
