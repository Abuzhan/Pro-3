class AddIndexToServicesName < ActiveRecord::Migration
  def change
  	add_index :services, :name, unique: true
  end
end
