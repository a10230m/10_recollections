class Public::PhotoCommentsController < ApplicationController

  def create
    photo_image = PhotoImage.find(params[:photo_image_id])
    comment = current_user.photo_comments.new(photo_comment_params)
    comment.photo_image_id = photo_image.id
    comment.save
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

  # ここから通知機能

  def notification_create
    @photo_image = PhotoImage.find(params[:photo_image_id])
    #投稿に紐づいたコメントを作成
    @photo_comment = @photo_image.photo_comments.build(photo_comment_params)
    @photo_comment.user_id = current_user.id
    @photo_comment_photo_image = @comment.photo_image
    if @photo_comment.save
      #通知の作成
      @photo_comment_photo_image.create_notification_comment!(current_user, @photo_comment.id)
      render :index
    end
  end

end
