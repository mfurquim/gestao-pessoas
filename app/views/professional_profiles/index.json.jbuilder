json.array!(@professional_profiles) do |professional_profile|
  json.extract! professional_profile, :id
  json.url professional_profile_url(professional_profile, format: :json)
end
