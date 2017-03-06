class RemoveClosingTimeFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :closing_time, :integer
  end
end
