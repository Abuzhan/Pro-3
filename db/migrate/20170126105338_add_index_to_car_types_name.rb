class AddIndexToCarTypesName < ActiveRecord::Migration
  def change
  	add_index :car_types, :name, unique: true
  end
end
