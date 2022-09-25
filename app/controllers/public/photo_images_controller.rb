class Public::PhotoImagesController < ApplicationController

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
    @photo_comment = PhotoComment.new
  end

  def index
    @photo_images = PhotoImage.all.order('id DESC')
    @photo_image_count = PhotoImage.where(params[:photo_image_id]).count
    # @photo_images = PhotoImage.page(params[:page])
    # @photo_images = PhotoImage.where(created_at: @month.in_time_zone.all_month).order(created_at: :asc)
  end

  def search
    @photo_images = PhotoImage.search(params["search(1i)"],params["search(2i)"],params["search(3i)"])
  end


  def userphotos
    # @user = @photo_images.user
    @photo_image = PhotoImage.find(params[:id])
    @photo_images = @photo_image.user.photo_images

    # @albums = @user.album.all.order('id DESC').limit(5)
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
    @photo_image.destroy
    redirect_to photo_images_path
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
