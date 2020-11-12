class AddNewTableCitys < ActiveRecord::Migration[5.2]
  def change
    create_table :citys do |t|
      t.string :name
      t.string :state
      t.integer :population
      t.integer :area
      t.string :average_temp
      t.text :neighborhood
      t.text :eat_drink


      t.timestamps
    end
  end
end
