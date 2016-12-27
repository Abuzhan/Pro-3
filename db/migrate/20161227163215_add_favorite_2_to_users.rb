class AddFavorite2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_2, :string
  end
end
