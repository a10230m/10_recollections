class Public::AlbumsController < ApplicationController
  before_action :authenticate_user!

  def new
    @album = Album.new
    @users = User.where(is_active: true).where.not(id: current_user.id)
  end

  def create
    @album = Album.new(album_params.except(:album_photo_images))
    @album.user_id = current_user.id
    params.dig(:album, :album_photo_images, :image)&.each do |image|
      album_photo_image = @album.album_photo_images.new
      album_photo_image.image.attach(image)
    end

    if @album.save
       user_ids = params[:album][:user_ids]
      unless user_ids == [""]
        user_ids.shift
        user_ids.each do |user_id|
          @album.album_releases.create!(user_id: user_id)
        end
      else
        User.where(is_active: true).pluck(:id).each do |user_id|
          @album.album_releases.create!(user_id: user_id)
        end

      end


      redirect_to album_path(@album.id), notice: 'Created successfully! Thank you.'
    else
       @users = User.where(is_active: true).where.not(id: current_user.id)
      render :new
    end
  end


  def show
    @album = Album.find(params[:id])
  end

  def index
    album_ids = current_user.albums.pluck(:id)

    album_ids.push(current_user.album_releases.pluck(:album_id))
    album_ids.flatten!
    @albums = Album.where(id: album_ids)

    # @album_photo_images = album.album_photo_images
    # @albums = Album.order('id DESC')
    # @albums = Album.page(params[:page])
  end

  def search
    @albums = Album.search(params["search(1i)"],params["search(2i)"],params["search(3i)"])

  end

  def useralbums
    @album = Album.find(params[:id])
    @albums = @album.user.albums
    # @albums = @user.album.all.order('id DESC').limit(5)
  end

  def edit
     @album = Album.find(params[:id])
     @users = User.where(is_active: true).where.not(id: current_user.id)
     if @album.user != current_user
       redirect_to albums_path
     end
  end


  def update
    @album = Album.find(params[:id])

    if params[:album][:images]
      params[:album][:images].each do |image|
      album_photo_image = @album.album_photo_images.new
      album_photo_image.image.attach(image)
      album_photo_image.save
      end
    end

    user_ids = params[:album][:user_ids]
    unless user_ids == [""]
      user_ids.shift
      user_ids.each do |user_id|
        unless @album.album_releases.find_by(user_id: user_id)
          album_release = AlbumRelease.new
          album_release.album_id = @album.id
          album_release.user_id = user_id
          album_release.save
        end
        @album.album_releases.where.not(user_id: user_ids).delete_all
      end
    else
        @album.album_releases.delete_all
    end

    #添付画像を個別に削除
    album_photo_image_ids = params[:album][:album_photo_image_ids]
    if album_photo_image_ids
      album_photo_image_ids.delete("0")
      album_photo_images = AlbumPhotoImage.where(id: album_photo_image_ids)
      album_photo_images.destroy_all
    end

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



  def releases
    @album = Album.first

  end

  private
  # ストロングパラメータ
  def album_params
    params.require(:album).permit(:album_title, :album_caption, album_photo_images: [])
  end


  def user_params
    params.require(:user).permit(:name, :email, :birthdate, :introduction, :albums_id, user_ids: [])
  end

  def search_params
    params.require(:search).permit(:created_at)
  end


end