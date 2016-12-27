class AddCarNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :car_number, :string
  end
end
