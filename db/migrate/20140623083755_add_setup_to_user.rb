class AddSetupToUser < ActiveRecord::Migration
  def change
    add_column :users, :setup, :boolean
  end
end
