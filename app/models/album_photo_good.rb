class AlbumPhotoGood < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_comment
end
