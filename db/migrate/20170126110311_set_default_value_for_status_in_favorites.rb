class SetDefaultValueForStatusInFavorites < ActiveRecord::Migration
  def change
  	change_column_default :favorites, :status, :true
  end
end
