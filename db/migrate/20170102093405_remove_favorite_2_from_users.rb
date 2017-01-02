class RemoveFavorite2FromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_2, :string
  end
end
