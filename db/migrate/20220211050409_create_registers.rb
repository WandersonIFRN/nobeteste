class CreateRegisters < ActiveRecord::Migration[7.0]
  def change
    create_table :registers do |t|
      t.string :tipo
      t.string :descricao
      t.float :valor
      t.float :saldo
      t.float :transferir

      t.timestamps
    end
  end
end
