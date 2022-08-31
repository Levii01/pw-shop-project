# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  # def update_resource(resource, params)
  #   if params[:password].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #     params.delete(:current_password) if params[:current_password].blank?
  #   end

  #   resource.update_without_password(params)
  # end
end
