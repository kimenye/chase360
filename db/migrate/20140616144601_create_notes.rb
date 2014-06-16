class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :message
      t.references :lead, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
