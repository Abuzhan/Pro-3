class AddOpeningHourToSchedules < ActiveRecord::Migration
  def change
  	add_column :schedules, :opening_hour, :integer
  end
end
