# frozen_string_literal: true

class ApplicationController < ActionController::Base
  USER_FIELDS = %i[first_name last_name login country zip_code city street aparment_no education].freeze
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :cart

  def cart
    @cart ||= Cart.not_completed.find_by(id: session[:cart_id]) || last_cart || create_card
  end

  protected

  def last_cart
    Cart.not_completed.find_by(user: current_user)
  end

  def create_card
    @cart = Cart.create(user: current_user)
    session[:cart_id] = @cart.id
    @cart
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :password_confirmation, *USER_FIELDS, interests: [])
    end
  end
end
