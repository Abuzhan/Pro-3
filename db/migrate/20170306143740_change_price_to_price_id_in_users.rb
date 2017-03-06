class ChangePriceToPriceIdInUsers < ActiveRecord::Migration
  def change
	rename_column :orders, :price, :price_id
  end
end
