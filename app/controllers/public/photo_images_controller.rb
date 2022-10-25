class Public::PhotoImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo_image = PhotoImage.new
  end

  def create
    @photo_image = PhotoImage.new(photo_image_params)
    @photo_image.user_id = current_user.id
    if @photo_image.save
      redirect_to photo_image_path(@photo_image.id), notice: 'Created successfully! Thank you.'
    else
      render :new
    end
  end

  def show
    @photo_image = PhotoImage.find(params[:id])
    @new_photo_comment = PhotoComment.new
  end

  def index
    @photo_images = PhotoImage.order('id DESC').page(params[:page])
    @photo_image_count = PhotoImage.where(params[:photo_image_id]).count
  end

  def search
    @photo_images = PhotoImage.search(params["search(1i)"],params["search(2i)"],params["search(3i)"]).page(params[:page])
  end

  def edit
     @photo_image = PhotoImage.find(params[:id])
     if @photo_image.user != current_user
       redirect_to photo_images_path
     end
  end

  def update
    @photo_image = PhotoImage.find(params[:id])
    if @photo_image.update(photo_image_params)
      redirect_to photo_image_path(@photo_image.id), notice: 'Updated successfully! Thank you.'
    else
      render :edit
    end
  end

  def destroy
    @photo_image = PhotoImage.find(params[:id])
    @user = current_user
    @photo_image.destroy
    redirect_to userphotos_user_path(@user.id)
  end





  private
  # ストロングパラメータ
  def photo_image_params
    params.require(:photo_image).permit(:photo_title, :photo_caption, :user_id, :image, :created_at, :search)
  end

  def search_params
    params.require(:search).permit(:created_at)
  end

end
