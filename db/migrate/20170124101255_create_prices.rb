class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :carwash_id
      t.integer :service_id
      t.integer :car_type_id
      t.integer :price
      t.boolean :status

      t.timestamps
    end
  end
end
