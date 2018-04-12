# frozen_string_literal: true

class SupermarketProductPrice < ApplicationRecord
  belongs_to :supermarket_product

  validates :price, presence: true

  def self.range(range_params)
    started = range_params[:started_at].to_date
    ended = range_params[:ended_at].to_date
    where(created_at: started.beginning_of_day..ended.end_of_day)
  end
end
