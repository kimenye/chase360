json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :image_url
  json.branches company.branches, :id, :name
  json.categories company.categories, :id, :name
  json.departments company.departments, :id, :name
  json.products company.products, :id, :name, :description, :image_url, :category_id
end