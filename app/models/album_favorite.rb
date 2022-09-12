class AlbumFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates_uniqueness_of :album_id, scope: :user_id


end
