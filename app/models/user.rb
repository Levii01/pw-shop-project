# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EDUCATION = { podstawowe: 0, średnie: 1, wyższe: 2 }.freeze
  INTERESTS = ['Wybierz zainteresowania', 'Astronomia', 'Kolarstwo', 'Jeździectwo', 'Wspinaczka', 'Minerały',
               'Rolnictwo', 'Instrumenty'].freeze

  enum education: EDUCATION

  strip_attributes only: %i[first_name last_name country city street aparment_no], collapse_spaces: true

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :login, presence: true, on: :update
  validates :country, presence: true, on: :update
  validates :zip_code, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :street, presence: true, on: :update
  validates :aparment_no, presence: true, on: :update
  validates :education, presence: true, on: :update
  validates :interests, presence: true, on: :update
end
