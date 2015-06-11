ActiveAdmin.register Branch do

  permit_params :name, :company_id
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
    column :company
    column :name
    # default_actions
  end

  active_admin_import_anything do |file|
    #write the code to handle the imported file
    doc = SimpleXlsxReader.open(file.tempfile)
        
    main_sheet = doc.sheets.first
    main_sheet.rows[1..main_sheet.rows.length].each do |row|
      company = Company.find_by(name: row[0])
      Branch.create! company: company, name: row[1]
    end
  end
  
end
