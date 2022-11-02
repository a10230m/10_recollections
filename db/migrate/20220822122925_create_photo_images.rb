class CreatePhotoImages < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_images do |t|

      t.integer :user_id, null: false
      t.string :photo_title
      t.text :photo_caption


      t.timestamps
    end
  end
end
