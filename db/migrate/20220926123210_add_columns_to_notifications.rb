class AddColumnsToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :album_photo_image_id, :integer
    add_column :notifications, :album_id, :integer
  end
end
