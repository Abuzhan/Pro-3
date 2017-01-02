class RemoveFavorite4FromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_4, :string
  end
end
