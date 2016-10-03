class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.references :artist, foreign_key: true
      t.integer :song_uid
      t.string :title
      t.string :cached_slug
      t.references :city, foreign_key: true

      t.index :song_uid, unique: true
      t.timestamps
    end
  end
end
