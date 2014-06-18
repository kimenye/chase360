ActiveAdmin.register Lead do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :name, :phone_number, :email, :status, :submitted_by_id, :assigned_to_id, :product_id, :branch_id

  index do
    column :id
    column :name
    column :email
    column :phone_number
    column :status
    column :submitted_by
    column :assigned_to
    column :company
    column :product    
    column :branch
    default_actions
  end
  
end
