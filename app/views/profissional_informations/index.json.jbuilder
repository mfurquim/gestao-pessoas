json.array!(@profissional_informations) do |profissional_information|
  json.extract! profissional_information, :id
  json.url profissional_information_url(profissional_information, format: :json)
end
