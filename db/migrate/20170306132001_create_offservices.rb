class CreateOffservices < ActiveRecord::Migration
  def change
    create_table :offservices do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
