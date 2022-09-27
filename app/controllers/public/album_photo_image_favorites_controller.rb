class Public::AlbumPhotoImageFavoritesController < ApplicationController

  before_action :set_album_photo_image

  def create
    @album_photo_image.album_photo_image_favorites.create(user_id: current_user.id)
    render :toggle
  end

  def destroy
    @album_photo_image.album_photo_image_favorites.find_by(user_id: current_user.id).destroy
    render :toggle
  end

  # ここから通知機能
  def notification_create
    album_photo_image_favorite = current_user.album_photo_image_favorites.new(album_photo_image_id: @album_photo_image.id)
    album_photo_image_favorite.save
    @album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    #通知の作成
    @album.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end


  private

  def set_album_photo_image
    @album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
  end

end
