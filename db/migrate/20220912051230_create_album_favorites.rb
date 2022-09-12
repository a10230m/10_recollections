class CreateAlbumFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :album_favorites do |t|
      t.integer :album_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
