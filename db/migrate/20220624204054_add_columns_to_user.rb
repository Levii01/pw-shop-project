# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name
      t.string :last_name
      t.string :login, index: { unique: true }
      t.string :country
      t.string :zip_code
      t.string :city
      t.string :street
      t.string :aparment_no
      t.integer :education
      t.string :interests, array: true
    end
  end
end
