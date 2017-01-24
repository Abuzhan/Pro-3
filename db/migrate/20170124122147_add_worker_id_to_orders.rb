class AddWorkerIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :worker_id, :integer
  end
end
