class PhotoComment < ApplicationRecord
  belongs_to :user
  belongs_to :photo_image
  has_many :goods, dependent: :destroy

  def gooded_by?(user)
    goods.exists?(user_id: user.id)
  end


  # good通知機能
  def create_notification_by(visiter_id)
    notification = Notification.new(
      photo_comment_id: id,
      photo_image_id: photo_image.id,
      visited_id: user_id,
      visiter_id: visiter_id,
      action: "good"
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save! if notification.valid?
  end

end
