class RemoveOnlineFromPrices < ActiveRecord::Migration
  def change
  	remove_column :prices, :online, :boolean
  end
end
