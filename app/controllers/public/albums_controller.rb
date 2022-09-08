class Public::AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    @album.user_id = current_user.id
      if @album.save
      params[:album][:images].each do |image|
        album_photo_image = @album.album_photo_images.new
        album_photo_image.image.attach(image)
        album_photo_image.save
      end
      redirect_to album_path(@album.id), notice: 'Created successfully! Thank you.'
      else
      render :new
      end
  end


  def show
    @album = Album.find(params[:id])
  end



  def index
    @albums = Album.all
    @albums = Album.order('id DESC')
    # @albums = Album.page(params[:page])
  end

  def edit
     @album = Album.find(params[:id])
     if @album.user != current_user
       redirect_to albums_path
     end
  end


  def update
    @album = Album.find(params[:id])
    #添付画像を個別に削除
    if params[:album][:images]
      params[:album][:images].each do |image|
      album_photo_image = @album.album_photo_images.new
      album_photo_image.image.attach(image)
      album_photo_image.save
      end
    end

    params[:album][:album_photo_image_ids].delete("0")

    if params[:album][:album_photo_image_ids]
      params[:album][:album_photo_image_ids].each do |image_id|
        image = @album.album_photo_images.find(image_id)
        image.destroy
      end
    end

    # @album.images.detach #一旦、すべてのimageの紐つけを解除
    if  @album.update(album_params)
      redirect_to album_path(@album.id), notice: 'Updated successfully! Thank you.'
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private
  # ストロングパラメータ
  def album_params
    params.require(:album).permit(:album_title, :album_caption, :user_id, :created_at, album_photo_images: [])
  end


end

#   def show
#     @album_pimage = Album.find(params[:id])
#   end

#   def index
#     @albums = Album.all
#     # @albums = Album.page(params[:page])
#   end

#   def edit
#     @album = Album.find(params[:id])
#     if @album.user != current_user
#       redirect_to albums_path
#     end
#   end

#   def update
#     @album = Album.find(params[:id])
#     if @album.update(album_params)
#       redirect_to album_path(@album.id), notice: 'Updated successfully! Thank you.'
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @album = Album.find(params[:id])
#     @album.destroy
#     redirect_to albums_path
#   end

#   private
#   # ストロングパラメータ
#   def album_params
#     params.require(:album).permit(:album_title, :album_caption, :user_id, :created_at, images: [])
#   end

# end
