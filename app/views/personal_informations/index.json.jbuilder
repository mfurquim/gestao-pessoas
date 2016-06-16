json.array!(@personal_informations) do |personal_information|
  json.extract! personal_information, :id, :nome, :email, :rg, :cpf
  json.url personal_information_url(personal_information, format: :json)
end
