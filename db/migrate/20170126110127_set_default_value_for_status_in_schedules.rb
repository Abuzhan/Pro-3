class SetDefaultValueForStatusInSchedules < ActiveRecord::Migration
  def change
  	change_column_default :schedules, :status, :true
  end
end
