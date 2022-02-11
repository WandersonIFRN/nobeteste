class AddContaToRegister < ActiveRecord::Migration[7.0]
  def change
    add_reference :registers, :conta, null: false, foreign_key: true
  end
end
