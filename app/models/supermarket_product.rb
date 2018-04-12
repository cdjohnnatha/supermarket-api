# frozen_string_literal: true

class SupermarketProduct < ApplicationRecord
  belongs_to :supermarket
  belongs_to :product
  has_many :supermarket_product_prices, dependent: :destroy

  accepts_nested_attributes_for :supermarket_product_prices, reject_if: proc { |attrs| attrs[:price].nil? }

  def price
    self.supermarket_product_prices.select(:id, :price, :created_at).last
  end

  def self.create_product_add_to_supermarket(product_params, supermarket_product_params, supermarket)
    product = Product.create(product_params)
    supermarket_product = supermarket_product_params;
    
    self.transaction do
      if product.valid?
        supermarket_product[:product_id] = product.id
        supermarket_product = supermarket.supermarket_products.create(supermarket_product_params)
        if supermarket_product.valid?
          supermarket_product
        else
          ActiveRecord::Rollback
          supermarket_product
        end
      else
        ActiveRecord::Rollback
        product
      end
    end
  end

end
