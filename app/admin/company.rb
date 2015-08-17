ActiveAdmin.register Company do  
  actions :all, except: [:destroy]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :image, :as => :file
    end
    f.actions
  end
  
  show do |co|
    attributes_table do
      row :name
      row :description
      row :image do
        image_tag(co.image.thumb('300x200#').url) if co.image_stored?
      end
    end
    
  end

  index do
    column :id
    column :name
    column :description
    column :image
    actions
  end
  
  permit_params :name, :description, :image  
end
