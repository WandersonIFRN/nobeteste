class AddSaldoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :saldo, :float
  end
end
