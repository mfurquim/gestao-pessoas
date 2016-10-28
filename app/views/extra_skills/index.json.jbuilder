json.array!(@extra_skills) do |extra_skill|
  json.extract! extra_skill, :id
  json.url extra_skill_url(extra_skill, format: :json)
end
