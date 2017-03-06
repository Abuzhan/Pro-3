class AddSaturdayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :saturday, :string
  end
end
