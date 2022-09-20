class PhotoImage < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # def self.search(search)
  #   return PhotoImage.all unless search
  #     PhotoImage.where("cast(strftime('%Y', date_column) as int) = ?", desired_year)
  #     PhotoImage.where("cast(strftime('%m', date_column) as int) = ?", desired_month)
  #     PhotoImage.where("cast(strftime('%d', date_column) as int) = ?", desired_day_of_month)
  # end

  def self.search(search)
    return PhotoImage.all unless search
      PhotoImage.where(created_at: search.in_time_zone.all_year)
      PhotoImage.where(created_at: search.in_time_zone.all_month)
      PhotoImage.where(created_at: search.in_time_zone.all_day)
  end


  # def self.by_year(year)
  #   where('extract(year from date_column) = ?', year)
  # end


end

