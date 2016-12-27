class AddFavorite3ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_3, :string
  end
end
