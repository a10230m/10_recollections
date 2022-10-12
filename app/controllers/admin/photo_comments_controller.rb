class Admin::PhotoCommentsController < ApplicationController
  # def create
  #   photo_image = PhotoImage.find(params[:photo_image_id])
  #   comment = current_user.photo_comments.new(photo_comment_params)
  #   comment.photo_image_id = photo_image.id
  #   comment.save
  #   redirect_to photo_image_path(photo_image.id)
  # end

  def destroy
    PhotoComment.find(params[:id]).destroy
    redirect_to admin_photo_image_path(params[:photo_image_id])
  end

  private

  def photo_comment_params
    params.require(:photo_comment).permit(:comment)
  end



end