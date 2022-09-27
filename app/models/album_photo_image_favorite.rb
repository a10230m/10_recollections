class AlbumPhotoImageFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_image
  # belongs_to :album_photo_image, through: :album, source: :album_photo_image
  has_many :notifications, dependent: :destroy
  validates_uniqueness_of :album_photo_image_id, scope: :user_id
  # scop: :user_id
end
