class RemoveDayFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :day, :integer
  end
end
