class Public::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
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

end


private

  def user_params
  params.require(:user).permit(:name, :email, :birthdate, :introduction)

  end
