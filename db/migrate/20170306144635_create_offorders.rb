class CreateOfforders < ActiveRecord::Migration
  def change
    create_table :offorders do |t|
      t.integer :box_id
      t.integer :worker_id
      t.integer :combo_id
      t.string :car_number
      t.boolean :status
      t.integer :discount
      t.datetime :start_time
      t.datetime :end_time
      t.string :details
      t.integer :price

      t.timestamps
    end
  end
end
