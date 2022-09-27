class Notification < ApplicationRecord
  #スコープ(新着順)
	default_scope->{order(created_at: :desc)}

  	belongs_to :photo_image, optional: true
  	belongs_to :photo_comment, optional: true
  	belongs_to :album_photo_image, optional: true
  	belongs_to :album_photo_comment, optional: true
  	belongs_to :favorite, optional: true
  	belongs_to :album_favorite, optional: true
  	belongs_to :album_photo_image_favorite, optional: true



  	belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id'
  	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id'
end
