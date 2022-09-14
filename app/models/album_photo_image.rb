class AlbumPhotoImage < ApplicationRecord
  belongs_to :album
  has_one_attached :image　# ←いじらない
  has_many :favorites, dependent: :destroy
  # belongstoをいれると、けんさくをかけてしまうので、関係ないものをいれないこと（バリデーションの動作をする）


  def get_image
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
