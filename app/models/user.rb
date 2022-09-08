class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photo_images, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :favorites, dependent: :destroy
    # has_many_attached :album



  def favorited_by?(photo_image_id)
    favorites.where(photo_image_id: photo_image.id).exists?
  end



end
