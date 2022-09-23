class Public::FavoritesController < ApplicationController

  before_action :set_photo_image

  def create
    # Favorite.create(user_id: current_user.id, photo_image_id: params[:id])
    @photo_image.favorite_favorites.create(user_id: current_user.id)
    render :toggle
  end

  def destroy
    # Favorite.find_by(user_id: current_user.id, photo_image_id: params[:id]).destroy
    @photo_image.favorite_favorites.find_by(user_id: current_user.id).destroy
    render :toggle
  end

  private

  def set_photo_image
    @photo_image = PhotoImage.find(params[:photo_image_id])
  end

# ここから通知機能
  def create
    favorite = current_user.favorites.new(photo_image_id: @photo_image.id)
    favorite.save
    @photo_image = PhotoImage.find(params[:photo_image_id])
    #通知の作成
    @photo_image.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

end




