class Public::AlbumPhotoImageFavoritesController < ApplicationController

  before_action :album_photo_image_params

  def create
    AlbumPhotoImageFavorite.create(user_id: current_user.id, album_photo_image_id: params[:id])
  end

  def destroy
    AlbumPhotoImageFavorite.find_by(user_id: current_user.id, album_photo_image_id: params[:id]).destroy
  end

  private

  def album_params
    @album = Album.find(params[:id])
  end

end
