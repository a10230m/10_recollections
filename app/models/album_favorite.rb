class AlbumFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_many :notifications, dependent: :destroy

  validates_uniqueness_of :album_id, scope: :user_id


end
