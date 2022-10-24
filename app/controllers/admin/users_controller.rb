class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  def userphotos
    @user = User.find(params[:id])
    @photo_images = @user.photo_images.order('id DESC').page(params[:page])
    @photo_images_count = @user.photo_images.count
  end

  def useralbums
    @user = User.find(params[:id])
    @albums = @user.albums.order('id DESC').page(params[:page]).per(12)
    @albums_count = @user.albums.count
  end


  private

  def user_params
    params.require(:user).permit(:email, :name, :birthdate, :introduction, :is_active, :is_deleted, :user_id)

  end

end