json.array!(@users) do |user|
  json.extract! user, :id, :name, :user_name, :email, :password_digest, :role, :image
  json.url user_url(user, format: :json)
end
