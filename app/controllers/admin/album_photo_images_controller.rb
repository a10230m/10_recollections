class Admin::AlbumPhotoImagesController < ApplicationController
  def show
    @album_photo_image = AlbumPhotoImage.find(params[:id])
    # @new_album_photo_comment = AlbumPhotoComment.new
    @album = @album_photo_image.album
  end

  private
  # ストロングパラメータ
  def album_photo_image_params
    params.require(:album_photo_image).permit(:album_photo_image_title, :album_photo_image_caption, :created_at, :album_id, :image)
  end
end