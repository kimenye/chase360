class RemoveCompanyFromLeadsAndAddProductToLeads < ActiveRecord::Migration
  def change
  	remove_reference :leads, :company, index: true
  	add_reference :leads, :product, index: true
  end
end
