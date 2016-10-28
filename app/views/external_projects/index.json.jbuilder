json.array!(@external_projects) do |external_project|
  json.extract! external_project, :id
  json.url external_project_url(external_project, format: :json)
end
