class CreateOfforderservices < ActiveRecord::Migration
  def change
    create_table :offorderservices do |t|
      t.integer :order_id
      t.boolean :status
      t.integer :offprice_id

      t.timestamps
    end
  end
end
