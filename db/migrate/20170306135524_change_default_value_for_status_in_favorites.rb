class ChangeDefaultValueForStatusInFavorites < ActiveRecord::Migration
  def change
  	change_column_default :favorites, :status, :t
  end
end
