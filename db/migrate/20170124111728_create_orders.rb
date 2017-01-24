class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :box_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :price
      t.integer :status
      t.string :car_number

      t.timestamps
    end
  end
end
