class SetDefaultValueForStatusInCombos < ActiveRecord::Migration
  def change
  	change_column_default :combos, :status, :t
  end
end
