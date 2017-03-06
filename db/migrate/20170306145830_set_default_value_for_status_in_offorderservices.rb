class SetDefaultValueForStatusInOfforderservices < ActiveRecord::Migration
  def change
  	change_column_default :offorders, :status, :t
  end
end
