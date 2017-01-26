class SetDefaultValueForStatusInCarTypes < ActiveRecord::Migration
  def change
  	change_column_default :car_types, :status, :true
  end
end
