# frozen_string_literal: true

class CreateSupermarketProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :supermarket_products do |t|
      t.references :supermarket, foreign_key: true, index: true
      t.references :product, foreign_key: true, index: true
      t.float :price
      t.float :quantity

      t.timestamps
    end
  end
end
