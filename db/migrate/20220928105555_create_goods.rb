class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.integer :user_id
      t.integer :photo_image_id
      t.integer :photo_comment_id
      t.timestamps
    end
  end
end
