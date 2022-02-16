json.extract! register, :id, :tipo, :descricao, :valor, :saldo, :created_at, :updated_at, :transferir
json.url register_url(register, format: :json)
