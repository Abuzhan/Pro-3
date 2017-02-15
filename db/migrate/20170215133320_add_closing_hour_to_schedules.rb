class AddClosingHourToSchedules < ActiveRecord::Migration
  def change
  	add_column :schedules, :closing_hour, :integer
  end
end
