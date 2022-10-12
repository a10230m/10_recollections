class Admin::AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    # @user = User.find(params[:id])

    @albums = @album.user.albums
    @user = @album.user
  end

  def index
    @albums = Album.all
    @albums = Album.order('id DESC')
    # @albums = Album.page(params[:page])
  end

  def useralbums
    @album = Album.find(params[:id])
    @albums = @album.user.albums
    # @albums = @user.album.all.order('id DESC').limit(5)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admin_albums_path
  end


  private
  # ストロングパラメータ
  def album_params
    params.permit(:album_title, :album_caption, :user_id, :created_at, album_photo_images: {})
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthdate, :introduction, :albums_id)
  end

  # def search_params
  #   params.require(:search).permit(:created_at)
  # end


end
