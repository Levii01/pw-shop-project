# frozen_string_literal: true

class ApplicationController < ActionController::Base
  USER_FIELDS = %i[first_name last_name login country zip_code city street aparment_no education].freeze
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :password_confirmation, *USER_FIELDS, interests: [])
    end
  end
end
