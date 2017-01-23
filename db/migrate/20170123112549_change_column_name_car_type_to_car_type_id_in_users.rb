class ChangeColumnNameCarTypeToCarTypeIdInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :car_type, :car_type_id
  end
end
