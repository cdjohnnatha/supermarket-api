class CreateSupermarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :supermarkets do |t|
      t.string :name
      t.text :description, null: true

      t.timestamps
    end
  end
end
