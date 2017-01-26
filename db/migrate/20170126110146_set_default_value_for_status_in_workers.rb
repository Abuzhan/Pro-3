class SetDefaultValueForStatusInWorkers < ActiveRecord::Migration
  def change
  	change_column_default :workers, :status, :true
  end
end
