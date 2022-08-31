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
end
