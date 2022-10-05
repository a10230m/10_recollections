class Admin::PhotoImagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @photo_images = PhotoImage.all.order('id DESC')
  end

  def show
    @photo_image = PhotoImage.find(params[:id])
  end

  def update
  	@photo_image = PhotoImage.find(params[:id])
    @photo_image.update(photo_image_params)

    flash[:success] = "更新に成功しました"
  	redirect_to admin_photo_image_path
  end



private

  def photo_image_params
    params.require(:photo_image).permit(:user_id, :photo_title, :photo_caption)
  end

end
