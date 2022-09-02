# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    cart.completed_at = Time.current
    if cart.save
      redirect_to products_path, notice: "Order placed and email with all informations was sent, thank you!"
      FinalizeOrderMailer.finalize(cart).deliver_now
    else
      flash[:errors] = cart.errors&.full_messages.presence&.join || "Something went wrong, please contact with administrator"
      render :show, status: :unprocessable_entity
    end
  end

  # def update
  #   respond_to do |format|
  #     if @cart.update(cart_params)
  #       format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
  #       format.json { render :show, status: :ok, location: @cart }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
