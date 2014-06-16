class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :submitted_by_id
      t.string :status
      t.integer :assigned_to_id

      t.timestamps
    end
  end
end
