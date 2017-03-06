class AddThursdayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :thursday, :string
  end
end
