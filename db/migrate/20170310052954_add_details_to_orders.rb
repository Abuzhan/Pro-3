class AddDetailsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :details, :string
  end
end
