class AddOnlineToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :online, :boolean
  end
end
