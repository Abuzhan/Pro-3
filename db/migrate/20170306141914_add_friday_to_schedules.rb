class AddFridayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :friday, :string
  end
end
