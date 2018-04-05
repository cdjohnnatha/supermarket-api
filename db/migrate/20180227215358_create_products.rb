# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description, null: true
      t.string :barcode, unique: true
      t.string :brand

      t.timestamps
    end
  end
end
