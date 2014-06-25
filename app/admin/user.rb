ActiveAdmin.register User do

  permit_params :company_id, :employeeID, :first_name, :last_name, :email, :phone_number, :role_id, :backend_admin, :setup
 
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

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :role
    column :company
    column :points_available
    default_actions
  end
  
end



