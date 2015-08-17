ActiveAdmin.register Administrator do

  index do
    column :name
    actions
  end

  permit_params :name, :email, :password
end