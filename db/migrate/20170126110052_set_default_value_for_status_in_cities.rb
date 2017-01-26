class SetDefaultValueForStatusInCities < ActiveRecord::Migration
  def change
  	change_column_default :cities, :status, :true
  end
end
