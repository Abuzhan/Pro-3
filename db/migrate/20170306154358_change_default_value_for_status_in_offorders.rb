class ChangeDefaultValueForStatusInOrders < ActiveRecord::Migration
  def change
  	change_column_default :offorders, :status, nil
  end
end
