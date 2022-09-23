class AlbumPhotoImage < ApplicationRecord
  belongs_to :album
  has_one_attached :image # ←いじらない
  has_many :album_photo_image_favorites, dependent: :destroy
  has_many :album_photo_comments, dependent: :destroy
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
end
