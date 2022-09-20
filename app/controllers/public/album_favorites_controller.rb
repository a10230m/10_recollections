class Public::AlbumFavoritesController < ApplicationController
  before_action :set_album

  def create
    @album.album_favorites.create(user_id: current_user.id)
    render :toggle
  end

  def destroy
    @album.album_favorites.find_by(user_id: current_user.id).destroy
    render :toggle
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end
end