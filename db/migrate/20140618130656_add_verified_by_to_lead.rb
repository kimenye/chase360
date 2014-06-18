class AddVerifiedByToLead < ActiveRecord::Migration
  def change
    add_column :leads, :verified_by_id, :integer
    add_index :leads, :verified_by_id
    add_index :leads, :assigned_to_id
    add_index :leads, :submitted_by_id
  end
end
