class RemoveClosingHourFromScheduules < ActiveRecord::Migration
  def change
  	  	remove_column :schedules, :closing_hour, :integer
  end
end
