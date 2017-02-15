class ChangeOpeningHourDatatypeInSchedules < ActiveRecord::Migration

  def self.up
  	change_column :schedules, :opening_hour, :integer
  end

  def self.down
  	change_column :schedules, :opening_hour, :time
  end

end
