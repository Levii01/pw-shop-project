# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to root_path if current_user.admin.blank?
  end
end
