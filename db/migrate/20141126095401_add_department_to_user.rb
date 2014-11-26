class AddDepartmentToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :department
    add_reference :users, :department, index: true
  end
end
