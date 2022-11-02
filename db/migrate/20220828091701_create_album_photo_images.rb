class CreateAlbumPhotoImages < ActiveRecord::Migration[6.1]
  def change
    create_table :album_photo_images do |t|
      t.string :album_photo_title
      t.text :album_photo_caption
      t.integer :album_id, null: false
      t.timestamps
    end
  end
end
