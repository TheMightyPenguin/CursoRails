class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :twitter_url
      t.string :github_url
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :profiles, :people
  end
end
