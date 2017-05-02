class AddIndexToOrders < ActiveRecord::Migration
  def change
  	add_index :orders, [:box_id, :start_time], unique: true
  	add_index :orders, :user_id
  	add_index :orders, :box_id
  end
end
