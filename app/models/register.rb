class Register < ApplicationRecord
#    belongs_to :conta
    belongs_to :user
    validates :tipo, presence: true
    validates :valor, presence: true, numericality: {only_float: true, :greater_than => 0}
    validates :saldo, presence: true, numericality: {only_float: true, :greater_than => 0}

end
