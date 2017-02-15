class RemoveOpeningHourFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :opening_hour, :integer
  end
end
