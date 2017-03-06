class SetDefaultValueForStatusInOffservices < ActiveRecord::Migration
  def change
  	change_column_default :offservices, :status, :t
  end
end
