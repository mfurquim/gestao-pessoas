json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :project_description, :manager_name
  json.url project_url(project, format: :json)
end
