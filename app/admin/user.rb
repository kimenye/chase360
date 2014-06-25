ActiveAdmin.register User do

  permit_params :company_id, :employeeID, :name, :email, :phone_number, :role_id, :backend_admin, :setup
 
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
    column :name
    column :email
    column :phone_number
    column :role
    column :company
    column :department
    column :points_available
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :role
      f.input :company  
      f.input :department    
    end
    f.actions
  end
  
end



