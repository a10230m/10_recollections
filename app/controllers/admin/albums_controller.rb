class Admin::AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    # @user = @album.user
  end

  def index
    @albums = current_user.albums
    # @album_photo_images = album.album_photo_images
    # @albums = Album.order('id DESC')
    # @albums = Album.page(params[:page])
  end

  def useralbums
    @album = Album.find(params[:id])
    @albums = @album.user.albums
    # @albums = @user.album.all.order('id DESC').limit(5)
  end

  private
  # ストロングパラメータ
  def album_params
    params.permit(:album_title, :album_caption, :user_id, :created_at, album_photo_images: {})
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthdate, :introduction, :albums_id, user_ids: [])
  end

  # def search_params
  #   params.require(:search).permit(:created_at)
  # end


end
