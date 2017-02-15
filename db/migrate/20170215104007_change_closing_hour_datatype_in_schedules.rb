class ChangeClosingHourDatatypeInSchedules < ActiveRecord::Migration

  def self.up
  	change_column :schedules, :closing_hour, 'integer USING CAST("closing_hour" AS integer)'
  end

  def self.down
  	change_column :schedules, :closing_hour, :time
  end
end
