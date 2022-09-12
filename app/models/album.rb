class Album < ApplicationRecord
  belongs_to :user
  has_many :album_favorites, dependent: :destroy

  # cocoon？？
  has_many :album_photo_images, inverse_of: :album
   accepts_nested_attributes_for :album_photo_images, reject_if: :all_blank, allow_destroy: true





  def get_images
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    album_favorites.exists?(user_id: user.id)
  end

end
