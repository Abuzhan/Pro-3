raclass AddStatusToCarTypes < ActiveRecord::Migration
  def change
    add_column :car_types, :status, :boolean
  end
end
