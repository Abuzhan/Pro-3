class AddIndexToOffservicesName < ActiveRecord::Migration
  def change
  	add_index :offservices, :name, unique: true
  end
end
