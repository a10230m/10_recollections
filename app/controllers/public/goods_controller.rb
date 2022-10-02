class Public::GoodsController < ApplicationController

  before_action :set_photo_comment_good

  def create
    @photo_comment.goods.create!(user_id: current_user.id)
    @photo_comment.create_notification_by(current_user.id)
    render :toggle
  end

  def destroy
    # @photo_image = photo_image.photo_comment
    @photo_comment.goods.find_by!(user_id: current_user.id).destroy
    render :toggle
  end

  private

  def set_photo_comment_good
    @photo_image = PhotoImage.find(params[:photo_image_id])
    @photo_comment = PhotoComment.find(params[:photo_comment_id])
  end



end
