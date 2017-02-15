class ChangeColumnTypeCarTypeIdTointegerinUsers < ActiveRecord::Migration
  def self.up
  	change_column :users, :car_type_id, 'integer USING CAST("column_to_change" AS integer)'
  end

  def self.down
  	change_column :users, :car_type_id, :string
  end
end
