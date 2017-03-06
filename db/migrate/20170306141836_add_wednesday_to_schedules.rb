class AddWednesdayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :wednesday, :string
  end
end
