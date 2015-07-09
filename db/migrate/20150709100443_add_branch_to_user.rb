class AddBranchToUser < ActiveRecord::Migration
  def change
    add_reference :users, :branch, index: true
    add_foreign_key :users, :branches
  end
end
