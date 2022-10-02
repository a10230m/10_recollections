class Public::AlbumPhotoGoodsController < ApplicationController

  before_action :set_album_photo_comment_good

  def create
    @album_photo_comment.album_photo_goods.create!(user_id: current_user.id)
    @album_photo_comment.create_notification_by(current_user.id)
    render :toggle
  end

  def destroy
    @album_photo_comment.album_photo_goods.find_by!(user_id: current_user.id).destroy
    render :toggle
  end

  private

  def set_album_photo_comment_good
    @album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    @album_photo_comment = AlbumPhotoComment.find(params[:album_photo_comment_id])
  end
end
