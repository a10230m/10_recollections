class Public::FavoritesController < ApplicationController
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




