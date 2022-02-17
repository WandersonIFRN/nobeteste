class Register < ApplicationRecord
#    belongs_to :conta
    belongs_to :user
    validates :tipo, presence: true
    validates :valor, presence: true, numericality: {only_float: true, :greater_than => 0}
    validates :saldo, numericality: {only_float: true, :greater_than => 0}

    scope :filter_by_registermensal, lambda { |month_year|
        if month_year
          date = Date.strptime(month_year, '%B %Y')
          where created_at: date.beginning_of_month..date.end_of_month.next_day
        end
    }

end
