json.array!(@users) do |user|
  json.extract! user, :id, :code, :name, :password
  json.url user_url(user, format: :json)
end
