class AddIndexToUsersPhoneNumber < ActiveRecord::Migration
  def change
  	  add_index :users, :phone_number, unique:true
  end
end


