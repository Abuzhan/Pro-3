class AddDurationToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :duration, :integer
  end
end