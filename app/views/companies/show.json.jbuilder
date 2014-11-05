json.extract! @company, :id, :name
json.branches @company.branches, :id, :name
json.categories @company.categories, :id, :name
json.products @company.products, :id, :name, :description, :image_url, :category_id