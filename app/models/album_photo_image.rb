class AlbumPhotoImage < ApplicationRecord
  belongs_to :album
  has_one_attached :image
end
