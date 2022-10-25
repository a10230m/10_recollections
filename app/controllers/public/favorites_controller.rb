class Public::FavoritesController < ApplicationController

  before_action :set_photo_image

  def create
    @photo_image.favorites.create(user_id: current_user.id)
    render :toggle
  end

  def destroy
    @photo_image.favorites.find_by(user_id: current_user.id).destroy
    render :toggle
  end

  private

  def set_photo_image
    @photo_image = PhotoImage.find(params[:photo_image_id])
  end
end




