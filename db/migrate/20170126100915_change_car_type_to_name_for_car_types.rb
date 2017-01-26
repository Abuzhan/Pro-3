class ChangeCarTypeToNameForCarTypes < ActiveRecord::Migration
  def change
  	rename_column :car_types, :car_type, :name
  end
end
