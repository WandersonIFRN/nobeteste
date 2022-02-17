class User < ApplicationRecord
  has_many :register, dependent: :destroy
  # Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :saldo, numericality: {only_float: true, :greater_than => 0}
end
