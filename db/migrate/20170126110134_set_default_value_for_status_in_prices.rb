class SetDefaultValueForStatusInPrices < ActiveRecord::Migration
  def change
  	change_column_default :prices, :status, :true
  end
end
