json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :image_url
  json.branches company.branches, :id, :name
  json.products company.products, :id, :name, :description, :image_url
end