# frozen_string_literal: true

module Carts
  class CartProductsController < ApplicationController
    def create
      if cart_product.save
        redirect_to carts_path, notice: 'Product was successfully added!'
      else
        flash[:errors] = cart_product.errors.full_messages.join
        redirect_to products_path
      end
    end

    def destroy
      cart.cart_products.find(params[:id]).destroy

      redirect_to carts_path, notice: "Deleted product from cart"
    end

    private

    def cart_product
      @cart_product ||= if old_cart_product.present?
                          old_cart_product.amount += cart_product_params[:amount].to_i
                          old_cart_product
                        else
                          cart.cart_products.new(cart_product_params)
                        end
    end

    def old_cart_product
      @old_cart_product ||= cart.cart_products.find_by(product_id: cart_product_params[:product_id])
    end

    def cart_product_params
      params.require(:cart_product).permit(:product_id, :amount)
    end
  end
end
