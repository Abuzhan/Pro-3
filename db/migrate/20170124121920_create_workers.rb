class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.integer :carwash_id
      t.integer :fixed_salary
      t.integer :percentage
      t.boolean :status

      t.timestamps
    end
  end
end
