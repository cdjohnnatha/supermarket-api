class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description, null: true
      t.string :barcode
      t.string :brand
      t.integer :quantity

      t.timestamps
    end
  end
end
