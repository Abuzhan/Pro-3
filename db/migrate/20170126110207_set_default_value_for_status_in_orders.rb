class SetDefaultValueForStatusInOrders < ActiveRecord::Migration
  def change
  	change_column_default :orders, :status, :true
  end
end
