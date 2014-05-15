class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :employeeID
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :role_id
      t.boolean :backend_admin

      t.timestamps
    end
  end
end