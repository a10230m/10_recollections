class Public::FavoritesController < ApplicationController

  # def create
  #   photo_image = PhotoImage.find(params[:photo_image_id])
  #     favorite = current_user.favorites.new(photo_image_id: photo_image.id)
  #     favorite.save
      # redirect_to photo_image_path(photo_image)
# 以下使用していない
    # album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    #   favorite = current_user.favorites.new(album_photo_image_id: album_photo_image.id)
    #   favorite.save
    #   redirect_to album_photo_image_path(album_photo_image)
    # end
  # end
  # def destroy
    # photo_image = PhotoImage.find(params[:photo_image_id])
    #   favorite = current_user.favorites.find_by(photo_image_id: photo_image.id)
    #   favorite.destroy
    #   redirect_to photo_image_path(photo_image)
# 以下使用していない
    # album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    #   favorite = current_user.favorites.find_by(album_photo_image_id: album_photo_image.id)
    #   favorite.destroy
    #   redirect_to album_photo_image_path(album_photo_image)
  # end

  before_action :photo_image_params
  def create
    Favorite.create(user_id: current_user.id, photo_image_id: params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, photo_image_id: params[:id]).destroy
  end

  private

  def photo_image_params
    @photo_image = PhotoImage.find(params[:id])
  end


end




