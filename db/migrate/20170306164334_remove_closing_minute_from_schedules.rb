class RemoveClosingMinuteFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :opening_minute, :integer
  end
end
