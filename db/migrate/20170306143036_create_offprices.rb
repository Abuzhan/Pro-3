class CreateOffprices < ActiveRecord::Migration
  def change
    create_table :offprices do |t|
      t.integer :carwash_id
      t.integer :offservice_id
      t.integer :car_type_id
      t.integer :price
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
