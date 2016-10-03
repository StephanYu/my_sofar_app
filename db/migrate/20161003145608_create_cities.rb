class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.integer :city_uid
      t.string :title
      t.string :cached_slug

      t.index :city_uid, unique: true
      t.timestamps
    end
  end
end
