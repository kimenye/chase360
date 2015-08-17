ActiveAdmin.register Branch do

  permit_params :name, :company_id

  actions :all, except: [:destroy]

  index do
    column :id
    column :company
    column :name  
    actions
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
