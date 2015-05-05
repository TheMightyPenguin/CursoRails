class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color
      t.string :brand
      t.string :plate

      t.timestamps null: false
    end
  end
end
