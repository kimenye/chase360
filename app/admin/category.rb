ActiveAdmin.register Category do  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :company
    end
    f.actions
  end

  show do |p|
    attributes_table do
      row :name
      row :company
    end
  end

  index do 
    column :id
    column :name
    column :company
    # default_actions
  end

  permit_params :name, :company_id
end
