class Album < ApplicationRecord
  belongs_to :user
  has_many :album_photo_images
  has_many_attached :images
  # has_many :favorites, dependent: :destroy


  def get_images
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
