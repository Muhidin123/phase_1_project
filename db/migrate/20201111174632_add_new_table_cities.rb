class AddNewTableCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :population
      t.integer :area
      t.string :average_temp
      t.text :eat_drink
      t.text :restaurant
      t.text :landmark
      t.text :activity


      t.timestamps
    end
  end
end