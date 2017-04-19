class ChangeOrderIdToOfforderIdInOfforderservices < ActiveRecord::Migration
  def change
  	rename_column :offorderservices, :order_id, :offorder_id
  end
end
