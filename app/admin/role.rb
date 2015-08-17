ActiveAdmin.register Role do

  permit_params :name
  actions :all, except: [:destroy]

  index do
  	column :name
  	actions
  end
  
end
