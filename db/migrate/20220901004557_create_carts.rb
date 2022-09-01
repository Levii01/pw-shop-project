class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.decimal :balance, precision: 13, scale: 2
      t.datetime :completed_at

      t.timestamps
    end
  end
end
