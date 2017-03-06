class SetDefaultValueForStatusInOrders < ActiveRecord::Migration
  def change
  	change_column_default :orders, :status, :t
  end
end
