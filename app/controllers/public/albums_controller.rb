class Public::AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params.except(:album_photo_images))
    @album.user_id = current_user.id
    album_params[:album_photo_images][:image].each do |image|
      album_photo_image = @album.album_photo_images.new
      album_photo_image.image.attach(image)
    end
    if @album.save
      redirect_to album_path(@album.id), notice: 'Created successfully! Thank you.'
    else
      render :new
    end
  end


  def show
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all.order('id DESC')
    # @album_photo_images = album.album_photo_images
    # @albums = Album.order('id DESC')
    # @albums = Album.page(params[:page])
  end

  def useralbums
    @album = Album.find(params[:id])
    @albums = @album.user.albums
    # @albums = @user.album.all.order('id DESC').limit(5)
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
    if params[:album_photo_images][:image]
      params[:album_photo_images][:image].each do |image|
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
    params.require(:album).permit(:album_title, :album_caption, :user_id, :created_at, album_photo_images: {})
  end


  def user_params
  params.require(:user).permit(:name, :email, :birthdate, :introduction, :user_id, :albums_id)

  end


end