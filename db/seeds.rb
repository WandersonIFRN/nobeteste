# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Register.delete_all

user = User.first
text = "PageMaker including versions of Lorem Ipsum."

p 'Iniciando ...'

User.all.each do |user|
  100.times do
    Register.create!(
      tipo: "Deposito",
      descricao: text,
      valor:  "#{rand(10_000)}",
      saldo: 10,
      user_id: user.id,
      user_id: user.id,
      created_at: rand(900).days.ago
    )
  end
end

p 'Terminou!'