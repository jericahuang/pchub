json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :content
  json.url notification_url(notification, format: :json)
end
