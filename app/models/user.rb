class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :profile_image

  has_many :albums

  has_many :album_releases, dependent: :destroy
  has_many :released_albums, through: :album_releases, source: :album

  has_many :photo_images, dependent: :destroy

  has_many :favorites, dependent: :destroy
  # favoriteをとおして、フォトイメージを結ぶ
  has_many :favorited_photo_images, through: :favorites, source: :photo_image
  #  has_many_attached :album
  has_many :album_favorites, dependent: :destroy
  has_many :favorited_albums, through: :album_favorites, source: :album

  has_many :album_photo_image_favorites, dependent: :destroy
  has_many :favorited_album_photo_images, through: :album_photo_image_favorites, source: :album_photo_image

  has_many :photo_comments, dependent: :destroy
  has_many :album_photo_comments, dependent: :destroy

  has_many :goods, dependent: :destroy
  has_many :album_photo_goods, dependent: :destroy

  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/猫のシルエット.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end



  def favorited_by?(photo_image_id)
    favorites.where(photo_image_id: photo_image_id).exists?
  end

  def album_favorited_by?(album_id)
    album_favorites.where(album_id: album_id).exists?
  end

  def album_photo_image_favorited_by?(album_photo_image_id)
    album_photo_image_favorites.where(album_photo_image_id: album_photo_image_id).exists?
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end


end
