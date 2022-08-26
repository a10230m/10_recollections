class Public::AlbumImagesController < ApplicationController

  def new
    @album_imege = AlbumImage.new
  end

  def create
    @album_image = AlbumImage.new(album_image_params)
    @album_image.user_id = current_user.id

    # @album_imege = album_image(album_image_params)
    if @album_image.save
      redirect_to album_image_path(@album_image.id), notice: 'Created successfully! Thank you.'
    else
      render :new
    end
  end


  def show
    @album_image = AlbumImage.find(params[:id])
  end

  def index
    @album_images = AlbumImage.all
    # @album_images = AlbumImage.page(params[:page])
  end


  private
  # ストロングパラメータ
  def album_image_params
    params.require(:album_image).permit(:album_title, :album_caption, :user_id, :created_at, images: [])
  end

end
