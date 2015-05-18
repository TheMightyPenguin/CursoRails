class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :photo_name
      t.string :description
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :albums, :people
  end
end
