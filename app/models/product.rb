# frozen_string_literal: true

class Product < ApplicationRecord
  # has_many :carts
  has_many :cart_products, dependent: :destroy
end
