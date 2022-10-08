class ApplicationController < ActionController::Base

  before_action :configure_sign_up_params, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_users_path
    when User
      root_path
    end
  end


  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      user_session_path
    end
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :birthdate, :introductio, :password])
  end


end
