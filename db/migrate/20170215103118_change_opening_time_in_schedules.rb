class ChangeOpeningTimeInSchedules < ActiveRecord::Migration
  def change
  	rename_column :schedules, :opening_time, :opening_hour
  end
end
