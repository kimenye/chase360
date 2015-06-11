ActiveAdmin.register Role do

  permit_params :name

  index do
  	column :name
  	# default_actions
  end
  
end
