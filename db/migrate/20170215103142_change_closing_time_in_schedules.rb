class ChangeClosingTimeInSchedules < ActiveRecord::Migration
  def change
  	  	rename_column :schedules, :closing_time, :closing_hour
  end
end
