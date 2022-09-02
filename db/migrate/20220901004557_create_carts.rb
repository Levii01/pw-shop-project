# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.decimal :balance, precision: 13, scale: 2
      t.datetime :completed_at
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
