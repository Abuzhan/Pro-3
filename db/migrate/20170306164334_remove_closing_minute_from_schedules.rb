class RemoveClosingMinuteFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :closing_minute, :integer
  end
end
