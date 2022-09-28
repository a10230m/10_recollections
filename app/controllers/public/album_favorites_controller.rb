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

  # ここから通知機能
  # def notification_create
  #   album_favorite = current_user.album_favorites.new(album_id: @album.id)
  #   album_favorite.save
  #   @album = Album.find(params[:album_id])
  #   #通知の作成
  #   @album.create_notification_by(current_user)
  #   respond_to do |format|
  #     format.html {redirect_to request.referrer}
  #     format.js
  #   end
  # end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end
end