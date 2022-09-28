class Good < ApplicationRecord
  belongs_to :user
  belongs_to :photo_comment
end
