class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photo_images, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favoriteをとおして、フォトイメージを結ぶ
  has_many :favorited_photo_images, through: :favorites, source: :photo_image
  #  has_many_attached :album
  has_many :album_favorites, dependent: :destroy
  has_many :favorited_albums, through: :album_favorites, source: :album

  has_many :album_photo_image_favorites, dependent: :destroy




  def favorited_by?(photo_image_id)
    favorites.where(photo_image_id: photo_image_id).exists?
  end

  def album_favorited_by?(album_id)
    album_favorites.where(album_id: album_id).exists?
  end

  def album_photo_image_favorited_by?(album_id)
    album_photo_image_favorites.where(album_photo_image_id: album_photo_image_id).exists?
  end


end
