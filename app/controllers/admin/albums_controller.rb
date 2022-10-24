class Admin::AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    # @user = User.find(params[:id])

    @albums = @album.user.albums
    @user = @album.user
  end

  def index
    @albums = Album.order('id DESC').page(params[:page]).per(12)
    @album_count = Album.where(params[:album_id]).count
  end

  def useralbums
    @album = Album.find(params[:id])
    @albums = @album.user.albums
    @albumusers = @album.user
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
    params.require(:album).permit(:album_title, :album_caption, album_photo_images: [], user_ids: [])
  end


  def user_params
    params.require(:user).permit(:name, :email, :birthdate, :introduction, :albums_id, user_ids: [])
  end

end
