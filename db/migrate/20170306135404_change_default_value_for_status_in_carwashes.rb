class ChangeDefaultValueForStatusInCarwashes < ActiveRecord::Migration
  def change
  	change_column_default :carwashes, :status, :t
  end
end
