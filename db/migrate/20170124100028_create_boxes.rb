class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :carwash_id
      t.boolean :online
      t.boolean :status

      t.timestamps
    end
  end
end
