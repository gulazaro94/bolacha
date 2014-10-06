json.array!(@users) do |user|
  json.extract! user, :id, :name, :picture, :birth_date, :bio, :status
  json.url user_url(user, format: :json)
end
