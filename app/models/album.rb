class Album < ApplicationRecord
  belongs_to :user
  has_many :album_favorites, dependent: :destroy
  has_many :album_photo_images, inverse_of: :album
  has_many :album_releases, dependent: :destroy
  has_many :users, through: :album_releases

  validates :album_photo_images, presence: true

  def get_images(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    album_favorites.exists?(user_id: user.id)
  end

  def self.search(year = nil, month = nil,day = nil)
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
      Album.where(created_at: date.in_time_zone.all_day)
    elsif year.present? && month.present?
      date = year + month + "01"
      Album.where(created_at: date.in_time_zone.all_month)
    elsif year.present?
      date = year + "01" + "01"
      Album.where(created_at: date.in_time_zone.all_year)
    else
      Album.all
    end
  end

  # favorite通知機能
  def create_notification_by(visiter)
    notification = Notification.new(
      album_id: id,
      visited_id: visiter_id,
      visiter_id: visiter_id,
      action: "album_favorite"
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save! if notification.valid?
  end


end
