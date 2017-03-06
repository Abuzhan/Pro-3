class AddTuesdayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :tuesday, :string
  end
end
