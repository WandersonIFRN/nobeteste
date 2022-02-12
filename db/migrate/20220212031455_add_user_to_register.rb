class AddUserToRegister < ActiveRecord::Migration[7.0]
  def change
    add_reference :registers, :user, null: false, foreign_key: true
  end
end
