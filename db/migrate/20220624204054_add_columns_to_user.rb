# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :login, null: false, index: { unique: true }
      t.string :country, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :aparment_no
      t.integer :education
      t.string :interests, array: true
    end
  end
end
