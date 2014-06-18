ActiveAdmin.register Role do

  permit_params :name

  index do
  	column :name
  end
  
end
