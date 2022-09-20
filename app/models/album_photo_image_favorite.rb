class AlbumPhotoImageFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_image
  # belongs_to :album_photo_image, through: :album, source: :album_photo_image

  validates_uniqueness_of :album_photo_image_id, scope: :album_id
  # scop: :user_id
end
