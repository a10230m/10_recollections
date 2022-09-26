class AddColumnsToAlbumPhotoImages < ActiveRecord::Migration[6.1]
  def change
    change_column_null :album_photo_images, :album_photo_caption, false, 0
    change_column_default :album_photo_images, :album_photo_caption, from: nil, to: ""
  end
end
