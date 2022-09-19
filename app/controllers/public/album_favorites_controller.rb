class Public::AlbumFavoritesController < ApplicationController


  # def create
  #   album = Album.find(params[:album_id])
  #     album_favorite = current_user.favorites.new(album_id: album.id)
  #     album_favorite.save
  #     redirect_to album_path(album)
  # end

  # def destroy
  #   album = Album.find(params[:album_id])
  #     album_favorite = current_user.favorites.find_by(album_id: album.id)
  #     album_favorite.destroy
  #     redirect_to album_path(album)
  # end

  before_action :album_params
  
  def create
    AlbumFavorite.create(user_id: current_user.id, album_id: params[:id])
  end

  def destroy
    AlbumFavorite.find_by(user_id: current_user.id, album_id: params[:id]).destroy
  end

  private

  def album_params
    @album = Album.find(params[:id])
  end

end