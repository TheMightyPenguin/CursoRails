class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :state
      t.references :person

      t.timestamps null: false
    end
  end
end
