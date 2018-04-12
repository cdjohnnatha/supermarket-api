# frozen_string_literal: true

class CreateSupermarketProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :supermarket_product_prices do |t|
      t.references :supermarket_product, foreign_key: true, index: true
      t.float :price

      t.timestamps
    end
  end
end
