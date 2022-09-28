class AlbumPhotoComment < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_image
  has_many :album_photo_goods, dependent: :destroy

  def gooded_by?(user)
    album_photo_goods.exists?(user_id: user.id)
  end
end
