class CreateAlbumPhotoImageFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :album_photo_image_favorites do |t|
      t.integer :album_photo_image_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
