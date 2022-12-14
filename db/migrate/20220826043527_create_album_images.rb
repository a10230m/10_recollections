class CreateAlbumImages < ActiveRecord::Migration[6.1]
  def change
    create_table :album_images do |t|
      t.integer :user_id, null: false
      t.string :album_title
      t.text :album_caption

      t.timestamps
    end
  end
end
