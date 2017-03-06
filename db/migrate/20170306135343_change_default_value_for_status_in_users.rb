class ChangeDefaultValueForStatusInUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :status, :t
  end
end
