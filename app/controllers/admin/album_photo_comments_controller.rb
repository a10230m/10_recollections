class Admin::AlbumPhotoCommentsController < ApplicationController
  def destroy
    AlbumPhotoComment.find(params[:id]).destroy
    redirect_to admin_album_photo_image_path(params[:album_photo_image_id])
  end

  private

  def album_photo_comment_params
    params.require(:album_photo_comment).permit(:comment)
  end
end


