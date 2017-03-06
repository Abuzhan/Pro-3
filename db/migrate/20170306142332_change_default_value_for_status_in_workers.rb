class ChangeDefaultValueForStatusInWorkers < ActiveRecord::Migration
  def change
  	change_column_default :workers, :status, :t
  end
end
