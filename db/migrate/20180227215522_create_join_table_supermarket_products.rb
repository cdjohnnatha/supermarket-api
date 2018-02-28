class CreateJoinTableSupermarketProducts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :supermarkets, :products do |t|
      t.index [:supermarket_id, :product_id]
      # t.index [:product_id, :supermarket_id]
    end
  end
end
