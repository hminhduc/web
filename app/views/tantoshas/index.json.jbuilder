json.array!(@tantoshas) do |tantosha|
  json.extract! tantosha, :id, :tanto_code, :tanto_name, :tanto_password
  json.url tantosha_url(tantosha, format: :json)
end
