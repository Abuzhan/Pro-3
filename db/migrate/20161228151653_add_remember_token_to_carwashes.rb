class AddRememberTokenToCarwashes < ActiveRecord::Migration
  def change
  	add_column :carwashes, :remember_token, :string
  	add_index :carwashes, :remember_token
  end
end
