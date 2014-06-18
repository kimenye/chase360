class AddValueToLead < ActiveRecord::Migration
  def change
    add_column :leads, :value, :decimal
  end
end
