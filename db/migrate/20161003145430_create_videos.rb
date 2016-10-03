class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :video_uid
      t.text :thumb_url
      t.references :song, foreign_key: true

      t.index :video_uid, unique: true
      t.timestamps
    end
  end
end
