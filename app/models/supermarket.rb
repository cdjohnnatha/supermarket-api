# frozen_string_literal: true

class Supermarket < ApplicationRecord
  has_and_belongs_to_many :products
  
  validates :name, presence: true
  validates :description, presence: false
end
