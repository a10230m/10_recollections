class CreateAlbumPhotoGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :album_photo_goods do |t|
      t.integer :user_id
      t.integer :album_photo_image_id
      t.integer :album_photo_comment_id
      t.timestamps
    end
  end
end
