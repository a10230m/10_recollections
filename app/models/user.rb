class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photo_images, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :favorites, dependent: :destroy
#  has_many_attached :album
  has_many :album_favorites, dependent: :destroy




  def favorited_by?(photo_image_id)
    favorites.where(photo_image_id: photo_image.id).exists?
  end


  def favorited_by?(album_id)
    favorites.where(album_id: album.id).exists?
  end



end
