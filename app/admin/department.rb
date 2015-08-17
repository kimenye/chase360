ActiveAdmin.register Department do

  actions :all, except: [:destroy]
  permit_params :name, :company_id

  index do
    column :id
    column :company
    column :name
    actions
  end  
end
