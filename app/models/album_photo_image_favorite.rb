class AlbumPhotoImageFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_image
  validates_uniqueness_of :album_photo_image_id, scope: :user_id
end
