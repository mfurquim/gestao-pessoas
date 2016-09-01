json.array!(@academic_informations) do |academic_information|
  json.extract! academic_information, :id, :registration, :admission_year, :current_semester
  json.url academic_information_url(academic_information, format: :json)
end
