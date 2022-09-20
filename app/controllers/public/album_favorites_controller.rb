class Public::AlbumFavoritesController < ApplicationController
  before_action :album_params

  def create
    AlbumFavorite.create(user_id: current_user.id, album_id: params[:id])
  end

  def destroy
    AlbumFavorite.find_by(user_id: current_user.id, album_id: params[:id]).destroy
  end

  private

  def album_params
    @album = Album.find(params[:album_id])
  end

end