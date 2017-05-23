class AddIndexToOrders < ActiveRecord::Migration
	def change
  		add_index :orders, [:box_id, :start_time, :status], name: 'unique_index_to_avoid_duplicate_orders', where: "status = '1'", unique: true
   		#add_index :orders, [:box_id, :start_time, :status], name: 'unique_index_to_avoid_duplicate_orders2', where: "status = '2'", unique: false
  		add_index :orders, :user_id
  		add_index :orders, :box_id
  		add_index :orders, :status
  	end
end
