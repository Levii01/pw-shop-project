class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EDUCATION = { podstawowe: 0, średnie: 1, wyższe: 2 }.freeze

  enum education: EDUCATION
end
