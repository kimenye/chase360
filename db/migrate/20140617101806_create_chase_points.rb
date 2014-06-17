class CreateChasePoints < ActiveRecord::Migration
  def change
    create_table :chase_points do |t|
      t.references :user, index: true
      t.string :action
      t.integer :amount
      t.boolean :redeemed

      t.timestamps
    end
  end
end
