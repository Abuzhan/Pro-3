class AddDescriptionToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :description, :string
  end
end
