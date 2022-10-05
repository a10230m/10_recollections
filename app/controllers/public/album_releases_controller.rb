class Public::AlbumReleasesController < ApplicationController

  def create
    @album = Album.find(params[:album_id])
    @album_release = AlbumRelease.where(params[:album_id]).pluck(params[:user_id]).include?(current_user.id)
  end

  def release_params
    params.require(:release).permit(:album_id, user_id: [])
  end

end
