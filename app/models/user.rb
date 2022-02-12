class User < ApplicationRecord
  has_many :register, dependent: :destroy
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable,:database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
