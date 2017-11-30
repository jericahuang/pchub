json.array!(@users) do |user|
  json.extract! user, :id, :name, :nickname, :email, :country, :state_or_province, :city, :profile_link, :additional_information
  json.url user_url(user, format: :json)
end
