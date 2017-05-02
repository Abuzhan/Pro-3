class AddIndexToFavorites < ActiveRecord::Migration
  def change
  	add_index :favorites, :user_id
  	add_index :favorites, :carwash_id
  	add_index :favorites, [:user_id, :carwash_id], unique: true
  end
end
