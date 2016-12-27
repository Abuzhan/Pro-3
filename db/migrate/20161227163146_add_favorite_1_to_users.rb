class AddFavorite1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_1, :string
  end
end
