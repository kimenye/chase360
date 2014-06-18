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
    column :company
    column :name
    column :description
    column :image
    default_actions
  end
  
  permit_params :name, :description, :image, :company_id


  active_admin_import_anything do |file|
    #write the code to handle the imported file
    doc = SimpleXlsxReader.open(file.tempfile)
        
    main_sheet = doc.sheets.first
    main_sheet.rows[1..main_sheet.rows.length].each do |row|
      company = Company.find_by(name: row[0])
      Product.create! company: company, name: row[1], description: row[2]
    end
  end
  
end
