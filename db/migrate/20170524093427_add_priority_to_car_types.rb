class AddPriorityToCarTypes < ActiveRecord::Migration
  def change
    add_column :car_types, :priority, :integer
  end
end
