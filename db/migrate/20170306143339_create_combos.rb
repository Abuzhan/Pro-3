class CreateCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.string :name
      t.integer :carwash_id
      t.integer :car_type_id
      t.integer :price
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
