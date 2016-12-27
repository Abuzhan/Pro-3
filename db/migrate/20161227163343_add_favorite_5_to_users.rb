class AddFavorite5ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_5, :string
  end
end
