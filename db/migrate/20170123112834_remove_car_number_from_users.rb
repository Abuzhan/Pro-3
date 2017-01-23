class RemoveCarNumberFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :car_number, :string
  end
end
