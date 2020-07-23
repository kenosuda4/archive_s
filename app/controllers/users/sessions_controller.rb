# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # 退会ユーザー処理
  def create
    user = User.find_by(email: sign_in_params[:email])
    if user == nil
      super
    elsif user.is_deleted == true
      redirect_to homes_invalid_path
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #　テストユーザー用
  def new_guest
    user = User.guest
    sign_in user
    redirect_to user_path(user)
  end
end
