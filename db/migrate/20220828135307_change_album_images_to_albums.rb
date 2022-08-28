class ChangeAlbumImagesToAlbums < ActiveRecord::Migration[6.1]
  def change
    rename_table :album_images, :albums
  end
end
