class ChangePhoneNumberFromIntegerToBigintInCarwashes < ActiveRecord::Migration
	def self.up
  		change_column :carwashes, :phone_number, :integer
  	end

 	def self.down
  		change_column :carwashes, :phone_number, :bigint
  	end
end
