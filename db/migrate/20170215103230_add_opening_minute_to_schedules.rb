class AddOpeningMinuteToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :opening_minute, :integer
  end
end
