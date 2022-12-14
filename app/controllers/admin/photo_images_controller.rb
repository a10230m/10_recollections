class Admin::PhotoImagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @photo_images = PhotoImage.order('id DESC').page(params[:page])
    @photo_image_count = PhotoImage.where(params[:photo_image_id]).count
  end

  def show
    @photo_image = PhotoImage.find(params[:id])
    @user = @photo_image.user
  end

  def destroy
    @photo_image = PhotoImage.find(params[:id])
    @photo_image.destroy
    redirect_to admin_photo_images_path
  end



private

  def photo_image_params
    params.require(:photo_image).permit(:user_id, :photo_title, :photo_caption)
  end

end
