class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :employeeID
      t.string :first_name
      t.string :last_name
      t.integer :company_id
      t.string :email
      t.string :phone_number
      t.string :role_id

      t.timestamps
    end
  end
end
