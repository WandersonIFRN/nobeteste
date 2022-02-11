class Contum < ApplicationRecord
    has_many :register
    validates :nome, presence: true, length: { minimum: 5, maximum: 35 }
    validates :cpf, presence: true, length: { minimum: 11, maximum: 11 }
    validates :senha, presence: true, length: { minimum: 5, maximum: 15 }
    validates :saldo, presence: true, numericality: {only_float: true, :greater_than => 0}
end
