ActiveAdmin.register Product do
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :company
      f.input :description
      f.input :category
      f.input :image, :as => :file
      f.input :active, :as => :boolean
    end
    f.actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :description
      row :company
      row :category
      row :active
      row :image do
        image_tag(p.image.thumb('300x200#').url) if p.image_stored?
      end
    end
    
  end

  index do
    column :id
    column :company
    column :category
    column :name
    column :description
    column :image
    column :active
    default_actions
  end
  
  permit_params :name, :description, :image, :company_id, :category_id, :active


  active_admin_import_anything do |file|
    #write the code to handle the imported file
    doc = SimpleXlsxReader.open(file.tempfile)
        
    main_sheet = doc.sheets.first
    main_sheet.rows[1..main_sheet.rows.length].each do |row|
      company_name = row[0]
      category_name = row[1]
      product_name = row[2]
      description = row[3]
      company = Company.find_by(name: row[0])


      if !category_name.nil?
        category = Category.find_or_create_by(company_id: company.id, name: category_name)
      end
      
      if Product.find_by(company: company, name: product_name).nil?
        Product.create! company: company, name: product_name, description: description, category: category
      else
        product = Product.find_by(company: company, name: product_name)
        if product.category.nil? && !category.nil?
          product.category = category
          product.save!
        end
      end
    end
  end
  
end
