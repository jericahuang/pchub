json.array!(@applications) do |application|
  json.extract! application, :id, :name, :description, :operating_system
  json.url application_url(application, format: :json)
end
