# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :products
  belongs_to :user, optional: true
end
