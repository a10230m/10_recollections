class AlbumPhotoComment < ApplicationRecord
  belongs_to :user
  belongs_to :album_photo_image
  has_many :album_photo_goods, dependent: :destroy

  def gooded_by?(user)
    album_photo_goods.exists?(user_id: user.id)
  end

  # album_photo_good通知機能
  def create_notification_by(visiter_id)
    notification = Notification.new(
      album_photo_comment_id: id,
      album_photo_image_id: album_photo_image.id,
      visited_id: user_id,
      visiter_id: visiter_id,
      action: "album_photo_good"
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save! if notification.valid?
  end

end
