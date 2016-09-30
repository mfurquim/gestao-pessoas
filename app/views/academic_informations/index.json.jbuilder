json.array!(@academic_informations) do |academic_information|
  json.extract! academic_information, :id, :registration, :input_semester_year, :current_semester_year
  json.url academic_information_url(academic_information, format: :json)
end
