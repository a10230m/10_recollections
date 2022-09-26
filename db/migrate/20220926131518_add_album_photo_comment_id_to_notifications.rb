class AddAlbumPhotoCommentIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :album_photo_comment_id, :integer
  end
end
