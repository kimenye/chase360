json.array!(@new_users) do |user|
  json.extract! user, :id, :name, :image_url
end