class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :photo_image
  has_many :notifications, dependent: :destroy

  validates_uniqueness_of :photo_image_id, scope: :user_id



end
