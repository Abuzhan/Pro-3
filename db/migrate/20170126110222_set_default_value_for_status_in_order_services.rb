class SetDefaultValueForStatusInOrderServices < ActiveRecord::Migration
  def change
  	change_column_default :order_services, :status, :true
  end
end
