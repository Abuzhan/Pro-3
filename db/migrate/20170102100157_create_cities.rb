class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
    add_index :cities, :name, unique:true
  end
end
