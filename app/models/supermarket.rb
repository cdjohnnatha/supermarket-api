# frozen_string_literal: true

class Supermarket < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: false
end
