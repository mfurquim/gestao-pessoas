json.array!(@professional_informations) do |professional_information|
  json.extract! professional_information, :id, :string, :string, :date, :date, :text
  json.url professional_information_url(professional_information, format: :json)
end
