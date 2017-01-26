class SetDefaultValueForStatusInBoxes < ActiveRecord::Migration
  def change
  	change_column_default :boxes, :status, :true
  end
end
