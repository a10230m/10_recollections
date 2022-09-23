class AlbumPhotoComment < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_image
end
