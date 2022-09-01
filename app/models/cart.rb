# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products # FIXME: relation through
  belongs_to :user, optional: true

  scope :not_completed, -> { where(completed_at: nil) }


  def refresh_balance!
    update(balance: cart_products.sum { |cart_product| cart_product.amount * cart_product.product.price })
  end
end
