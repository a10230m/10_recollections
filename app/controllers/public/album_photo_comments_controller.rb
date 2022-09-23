class Public::AlbumPhotoCommentsController < ApplicationController
  def create
    album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    comment = current_user.album_photo_comments.new(album_photo_comment_params)
    comment.album_photo_image_id = album_photo_image.id
    comment.save
    redirect_to album_photo_image_path(album_photo_image.id)
  end

  def destroy
    AlbumPhotoComment.find(params[:id]).destroy
    redirect_to album_photo_image_path(params[:album_photo_image_id])
  end

  private

  def album_photo_comment_params
    params.require(:album_photo_comment).permit(:comment)
  end
end


