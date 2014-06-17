class AddCompanyToUser < ActiveRecord::Migration
  def change
    add_reference :users, :company, index: true
    add_column :users, :department, :string
  end
end
