json.array!(@info_personals) do |info_personal|
  json.extract! info_personal, :id, :nome, :email, :rg, :cpf
  json.url info_personal_url(info_personal, format: :json)
end
