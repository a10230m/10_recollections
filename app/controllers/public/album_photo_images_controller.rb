class Public::AlbumPhotoImagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @album_photo_image = AlbumPhotoImage.find(params[:id])
    @new_album_photo_comment = AlbumPhotoComment.new
    @album = @album_photo_image.album
    # ひもづいているものがひとつであれば、findは不要
  end

  def edit
     @album_photo_image = AlbumPhotoImage.find(params[:id])
     if @album_photo_image.album.user != current_user
       redirect_to album_photo_images_path
     end
  end

  def update
    @album_photo_image = AlbumPhotoImage.find(params[:id])
    if @album_photo_image.update(album_photo_image_params)
      redirect_to album_photo_image_path(@album_photo_image.id), notice: 'Updated successfully! Thank you.'
    else
      render :edit
    end
  end

  def destroy
    @album_photo_image = AlbumPhotoImage.find(params[:id])
    @album = @album_photo_image.album
    @album_photo_image.destroy
    redirect_to album_path(@album.id)
  end

  private
  # ストロングパラメータ
  def album_photo_image_params
    params.require(:album_photo_image).permit(:created_at, :album_id, :image)
  end
end
