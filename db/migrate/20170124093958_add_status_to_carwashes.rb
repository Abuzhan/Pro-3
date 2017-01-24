class AddStatusToCarwashes < ActiveRecord::Migration
  def change
    add_column :carwashes, :status, :boolean,  default: false
  end
end
