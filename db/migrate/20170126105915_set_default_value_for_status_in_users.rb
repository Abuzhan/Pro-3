class SetDefaultValueForStatusInUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :status, :true
  end
end
