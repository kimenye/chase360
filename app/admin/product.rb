ActiveAdmin.register Product do
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :company
      f.input :description
      f.input :image, :as => :file
    end
    f.actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :description
      row :company
      row :image do
        image_tag(p.image.thumb('300x200#').url) if p.image_stored?
      end
    end
    
  end

  index do
    column :id
    column :name
    column :description
    column :image
  end
  
  permit_params :name, :description, :image, :company_id
  
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
  
end
