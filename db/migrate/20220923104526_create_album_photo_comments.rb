class CreateAlbumPhotoComments < ActiveRecord::Migration[6.1]
  def change
    create_table :album_photo_comments do |t|
      t.integer :user_id
      t.integer :album_photo_image_id
      t.text :comment
      t.timestamps
    end
  end
end
