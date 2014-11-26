json.array!(@departments) do |department|
  json.extract! department, :id, :name, :company_id
end