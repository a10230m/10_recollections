class CreateAlbumReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :album_releases do |t|
      t.integer :user_id
      t.integer :album_id
      t.timestamps
    end
  end
end
