class PhotoImage < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :photo_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  def self.search(year = nil, month = nil, day = nil)
    if month != nil
      if month.length == 1
        month = "0" + month
      end
    end
    if day != nil
      if day.length == 1
        day = "0" + day
      end
    end
    if year.present? && month.present? && day.present?
      date = year + month + day
      PhotoImage.where(created_at: date.in_time_zone.all_day)
    elsif year.present? && month.present?
      date = year + month + "01"
      PhotoImage.where(created_at: date.in_time_zone.all_month)
    elsif year.present?
      date = year + "01" + "01"
      PhotoImage.where(created_at: date.in_time_zone.all_year)
    else
      PhotoImage.all
    end
  end

  # # favorite通知機能
  # def create_notification_by(visiter)
  #   notification = Notification.new(
  #     photo_image_id: id,
  #     visited_id: visiter_id,
  #     visiter_id: visiter_id,
  #     action: "favorite"
  #   )
  #   if notification.visiter_id == notification.visited_id
  #     notification.checked = true
  #   end
  #   notification.save! if notification.valid?
  # end


  def create_notification_comment!(visiter, photo_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = PhotoComment.where(photo_image_id: id).where.not(user_id: visiter.id).select(:user_id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(visiter.id, photo_comment_id, temp_id['user_id'])
    end
  	# まだ誰もコメントしていない場合は、投稿者に通知を送る
  	save_notification_comment!(visiter.id, photo_comment_id, user_id) if temp_ids.blank?
  end

	def save_notification_comment!(visiter_id, photo_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = Notification.new(
      photo_image_id: id,
      photo_comment_id: photo_comment_id,
      visited_id: visited_id,
      visiter_id: visiter_id,
      action: 'photo_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save! if notification.valid?
  end

end

