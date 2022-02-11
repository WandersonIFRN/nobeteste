class CreateConta < ActiveRecord::Migration[7.0]
  def change
    create_table :conta do |t|
      t.string :nome
      t.string :cpf
      t.string :senha
      t.string :tipo
      t.float :saldo

      t.timestamps
    end
  end
end
