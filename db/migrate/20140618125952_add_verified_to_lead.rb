class AddVerifiedToLead < ActiveRecord::Migration
  def change
    add_column :leads, :verified, :boolean
  end
end
