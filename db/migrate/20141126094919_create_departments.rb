class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :company, index: true
      t.string :name

      t.timestamps
    end
  end
end
