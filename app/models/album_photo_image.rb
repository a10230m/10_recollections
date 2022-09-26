class AlbumPhotoImage < ApplicationRecord
  belongs_to :album
  has_one_attached :image # ←いじらない
  has_many :album_photo_image_favorites, dependent: :destroy
  has_many :album_photo_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # belongstoをいれると、けんさくをかけてしまうので、関係ないものをいれないこと（バリデーションの動作をする）
    # accepts_nested_attributes_for :images


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    album_photo_image_favorites.exists?(user_id: user.id)
  end

# ここから通知機能
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      album_photo_image_id: id,
      visited_id: user_id,
      action: "favorite"
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, album_photo_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = AlbumPhotoComment.where(album_photo_image_id: id).where.not(user_id: current_user.id).select(:user_id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, album_photo_comment_id, temp_id['user_id'])
    end
  	# まだ誰もコメントしていない場合は、投稿者に通知を送る
  	save_notification_comment!(current_user, album_photo_comment_id, user_id) if temp_ids.blank?
  end

	def save_notification_comment!(current_user, album_photo_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      album_photo_image_id: id,
      album_photo_comment_id: album_photo_comment_id,
      visited_id: visited_id,
      action: 'album_photo_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save! if notification.valid?
  end

end

