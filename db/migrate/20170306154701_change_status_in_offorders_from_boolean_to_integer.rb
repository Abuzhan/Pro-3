class ChangeStatusInOffordersFromBooleanToInteger < ActiveRecord::Migration
	def self.up
  		change_column :offorders, :status, :integer
  	end

 	def self.down
  		change_column :offorders, :status, :boolean
  	end
end
