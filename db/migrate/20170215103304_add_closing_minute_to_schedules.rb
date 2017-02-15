class AddClosingMinuteToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :closing_minute, :integer
  end
end
