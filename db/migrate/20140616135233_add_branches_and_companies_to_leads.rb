class AddBranchesAndCompaniesToLeads < ActiveRecord::Migration
  def change
    add_reference :leads, :company, index: true
    add_reference :leads, :branch, index: true
  end
end
