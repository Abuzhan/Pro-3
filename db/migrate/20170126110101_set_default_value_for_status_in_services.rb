class SetDefaultValueForStatusInServices < ActiveRecord::Migration
  def change
  	change_column_default :services, :status, :true
  end
end
