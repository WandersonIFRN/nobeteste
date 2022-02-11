class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.float :valor
      t.float :saldo

      t.timestamps
    end
  end
end
