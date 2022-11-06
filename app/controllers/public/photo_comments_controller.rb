class Public::PhotoCommentsController < ApplicationController

  def create
    photo_image = PhotoImage.find(params[:photo_image_id])
    comment = current_user.photo_comments.new(photo_comment_params)
    comment.photo_image_id = photo_image.id
    comment.save
    # 以下の一文が通知機能
    comment.photo_image.create_notification_comment!(current_user, comment.id)
    redirect_to photo_image_path(photo_image.id)
  end

  def destroy
    PhotoComment.find(params[:id]).destroy
    redirect_to photo_image_path(params[:photo_image_id])
  end

  private

  def photo_comment_params
    params.require(:photo_comment).permit(:comment)
  end


end
