class ChangeDefaultValueForStatusInCarTypes < ActiveRecord::Migration
  def change
  	change_column_default :car_types, :status, :t
  end
end
