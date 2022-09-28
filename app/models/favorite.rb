class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :photo_image
  validates_uniqueness_of :photo_image_id, scope: :user_id



end
