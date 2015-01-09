class AddNoteToLead < ActiveRecord::Migration
  def change
    add_column :leads, :note, :text
  end
end
