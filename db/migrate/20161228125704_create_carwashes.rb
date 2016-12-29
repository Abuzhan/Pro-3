class CreateCarwashes < ActiveRecord::Migration
  def change
    create_table :carwashes do |t|
      t.string :name
      t.integer :phone_number
      t.string :address

      t.timestamps
    end
  end
end
