class AddFavorite4ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_4, :string
  end
end
