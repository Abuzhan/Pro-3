class SetDefaultValueForStatusInOffprices < ActiveRecord::Migration
  def change
  	change_column_default :offprices, :status, :t
  end
end
