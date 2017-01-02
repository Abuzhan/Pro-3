class RemoveFavorite3FromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_3, :string
  end
end
