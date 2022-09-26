class AddUserIdToAlbumPhotoImages < ActiveRecord::Migration[6.1]
  def change
    add_column :album_photo_images, :user_id, :integer
  end
end
