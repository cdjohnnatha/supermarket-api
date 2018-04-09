# frozen_string_literal: true

class CreateSupermarketAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :supermarket_addresses do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :street_number
      t.string :street_name
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :place_id, null: true
      t.references :supermarket, foreign_key: true, index: true

      t.timestamps
    end
  end
end
