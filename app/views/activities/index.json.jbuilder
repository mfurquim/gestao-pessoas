json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :description, :begin_date, :end_date, :status
  json.url activity_url(activity, format: :json)
end
