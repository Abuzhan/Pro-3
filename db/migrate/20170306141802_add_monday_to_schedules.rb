class AddMondayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :monday, :string
  end
end
