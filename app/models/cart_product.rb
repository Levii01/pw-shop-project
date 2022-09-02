# frozen_string_literal: true

class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product, presence: true
  validates :cart, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 1, only_integer: true}, presence: true

  after_commit :refresh_cart

  def name
    "#{product.brand}: #{product.name} #{product.model}"
  end

  def refresh_cart
    cart.refresh_balance!
  end

  def sum_price
    "#{amount * product.price} zł"
  end
end
