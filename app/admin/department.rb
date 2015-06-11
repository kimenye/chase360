ActiveAdmin.register Department do

  permit_params :name, :company_id

  index do
    column :id
    column :company
    column :name
    # default_actions
  end  
end
