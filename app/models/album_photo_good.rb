class AlbumPhotoGood < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_comment
  has_many :notifications, dependent: :destroy
end
