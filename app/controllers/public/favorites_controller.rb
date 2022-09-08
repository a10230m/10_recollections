class Public::FavoritesController < ApplicationController


  def create
    photo_image = PhotoImage.find(params[:photo_image_id])
      favorite = current_user.favorites.new(photo_image_id: photo_image.id)
      favorite.save
      redirect_to photo_image_path(photo_image)
    # elsif album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    #   favorite = current_user.favorites.new(album_photo_image_id: album_photo_image.id)
    #   favorite.save
    #   redirect_to album_photo_image_path(album_photo_image)
    # else album = Album.find(params[:album_id])
    #   favorite = current_user.favorites.new(album_id: album.id)
    #   favorite.save
    #   redirect_to album_path(album)
    # end

  end

  def destroy
    photo_image = PhotoImage.find(params[:photo_image_id])
      favorite = current_user.favorites.find_by(photo_image_id: photo_image.id)
      favorite.destroy
      redirect_to photo_image_path(photo_image)

    # elsif album_photo_image = AlbumPhotoImage.find(params[:album_photo_image_id])
    #   favorite = current_user.favorites.find_by(album_photo_image_id: album_photo_image.id)
    #   favorite.destroy
    #   redirect_to album_photo_image_path(album_photo_image)

    # else album = Album.find(params[:album_id])
    #   favorite = current_user.favorites.find_by(album_id: album.id)
    #   favorite.destroy
    #   redirect_to album_path(album)
    # end

  end

end


