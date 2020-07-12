class HomesController < ApplicationController
  def top
    @users = User.all
    @menus = Menu.all
    @competitions = Competition.all
    @informations = Information.where(is_valid: true).order(created_at: :desc).limit(10)
  end

  #ゲストユーザー用 sessions_controllerに変更
  # def new_guest
  #   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
      
  #   end
  #   sign_in user
  #   redirect_to root_path
  # end
end
