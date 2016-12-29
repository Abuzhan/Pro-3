class AddIndexToCarwashesPhoneNumber < ActiveRecord::Migration
  def change
  	add_index :carwashes, :phone_number, unique: true
  end
end
