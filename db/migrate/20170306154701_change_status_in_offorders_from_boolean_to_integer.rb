class ChangeStatusInOffordersFromBooleanToInteger < ActiveRecord::Migration
	def self.up
  		change_column :offorders, :status, 'integer USING CAST(status AS integer)'
  	end

 	def self.down
  		change_column :offorders, :status, :boolean
  	end
end
