class Good < ApplicationRecord
  belongs_to :user
  belongs_to :photo_comment
  # has_many :notifications, dependent: :destroy←不要
end
