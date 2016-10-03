class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.integer :artist_uid
      t.string :title
      t.string :cached_slug

      t.index :artist_uid, unique: true
      t.timestamps
    end
  end
end
