class RemoveFavorite1FromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_1, :string
  end
end
