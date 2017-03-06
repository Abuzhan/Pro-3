class ChangeDefaultValueForStatusInBoxes < ActiveRecord::Migration
  def change
  	change_column_default :boxes, :status, :t
  end
end
