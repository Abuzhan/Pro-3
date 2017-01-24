class AddCityIdToCarwashes < ActiveRecord::Migration
  def change
  	add_column :carwashes, :city_id, :integer
  end
end
