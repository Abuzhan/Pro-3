class ChangeDefaultValueForStatusInServices < ActiveRecord::Migration
  def change
  	change_column_default :services, :status, :t
  end
end
