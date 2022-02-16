class AddTransferirToRegister < ActiveRecord::Migration[7.0]
  def change
    add_column :registers, :transferir, :integer
  end
end
