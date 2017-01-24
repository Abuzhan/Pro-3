class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :carwash_id
      t.integer :day
      t.time :opening_time
      t.time :closing_time
      t.boolean :status

      t.timestamps
    end
  end
end
