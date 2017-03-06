class AddSundayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :sunday, :string
  end
end
