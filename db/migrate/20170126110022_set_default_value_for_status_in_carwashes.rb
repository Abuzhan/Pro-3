class SetDefaultValueForStatusInCarwashes < ActiveRecord::Migration
  def change
  	change_column_default :carwashes, :status, :true
  end
end
