class ChangeColumnTypeCityIdToIntegerInUsers < ActiveRecord::Migration
  def self.up
  	change_column :users, :city_id, :integer
  end

  def self.down
  	change_column :users, :city_id, :string
  end
end
