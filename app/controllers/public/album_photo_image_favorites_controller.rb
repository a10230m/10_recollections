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


  private

  def set_album_photo_image
    @album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
  end

end
