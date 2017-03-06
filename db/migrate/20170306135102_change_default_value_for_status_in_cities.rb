class ChangeDefaultValueForStatusInCities < ActiveRecord::Migration
  def change
  	change_column_default :cities, :status, :t
  end
end
