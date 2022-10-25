class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def mypage
    @user = current_user
    @photo_image_count = @user.photo_images.where(params[:photo_image_id]).count
    @photo_images = @user.photo_images
    @albums = @user.albums

  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      redirect_to mypage_users_path
    end
    @photo_images = @user.photo_images
    @photo_image_count = @user.photo_images.where(params[:photo_image_id]).count
    @photo_images = @user.photo_images.order('id DESC')
    @albums = @user.albums
  end

  def index
    @users = User.where(is_active: true)

  end

  def favorites
    @user = User.find(params[:id])
    @favorited_photo_images = @user.favorited_photo_images
    @favorited_albums = @user.favorited_albums
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to mypage_users_path
  end


  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
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
  params.require(:user).permit(:name, :email, :birthdate, :introduction, :user_id, :albums_id, :profile_image)

  end
end