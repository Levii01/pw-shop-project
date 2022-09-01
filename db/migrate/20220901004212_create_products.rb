class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 13, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
