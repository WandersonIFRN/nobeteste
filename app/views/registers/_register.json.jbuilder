json.extract! register, :id, :tipo, :descricao, :valor, :saldo, :transferir, :created_at, :updated_at
json.url register_url(register, format: :json)
