class RemoveOpeningTimeFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :opening_time, :integer
  end
end
