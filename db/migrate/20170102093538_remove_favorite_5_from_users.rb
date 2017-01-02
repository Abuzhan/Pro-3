class RemoveFavorite5FromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_5, :string
  end
end
