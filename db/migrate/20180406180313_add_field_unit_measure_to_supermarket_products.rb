class AddFieldUnitMeasureToSupermarketProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :supermarket_products, :unit_measure, :string, limit: 15
  end
end
