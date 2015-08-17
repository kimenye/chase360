ActiveAdmin.register Administrator do

  actions :all, except: [:destroy, :new]
  index do
    column :name
    actions
  end

  permit_params :name, :email, :password
end