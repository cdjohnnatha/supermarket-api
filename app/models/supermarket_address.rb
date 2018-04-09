# frozen_string_literal: true

class SupermarketAddress < ApplicationRecord
  belongs_to :supermarket

  validates :lat, presence: true
  validates :lng, presence: true
  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :country, presence: true
  validates :place_id, presence: false
end
