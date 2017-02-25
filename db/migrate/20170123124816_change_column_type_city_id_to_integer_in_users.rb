class ChangeColumnTypeCityIdToIntegerInUsers < ActiveRecord::Migration
  def self.up
  	change_column :users, :city_id, :integer #'integer USING CAST("city_id" AS integer)'
  end

  def self.down
  	change_column :users, :city_id, :string
  end
end
