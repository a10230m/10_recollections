class Public::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def mypage
    @user = current_user
    @photo_image_count = @user.photo_images.where(params[:photo_image_id]).count
    @photo_images = @user.photo_images
    @albums = @user.albums.order('id DESC').limit(5)

  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      redirect_to mypage_users_path
    end
    @photo_images = @user.photo_images
    @photo_image_count = @user.photo_images.where(params[:photo_image_id]).count
    @photo_images = @user.photo_images.order('id DESC').limit(4)
    @albums = @user.albums.order('id DESC').limit(5)
  end

  def index
    @users = User.all
  end

  def favorites
    user = User.find(params[:id])
    @favorited_photo_images = user.favorited_photo_images
  end

  def album_favorites
    user = User.find(params[:id])
    @favorited_albums = user.favorited_albums
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
    @user.update(is_active: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to user_session_path
  end

  def userphotos
    @user = User.find(params[:id])
    @photo_images = @user.photo_images
  end

  def useralbums
    @user = User.find(params[:id])
    @albums = @user.albums
  end

private

  def user_params
  params.require(:user).permit(:name, :email, :birthdate, :introduction, :user_id, :albums_id)

  end
end