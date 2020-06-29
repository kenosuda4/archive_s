class User::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update,]
  
  def index
    @users = User.all
    @menus = @user.menus.all
    @competitions = @user.competitions.all
  end

  def show
    @menus = @user.menus.all
    @competitions = @user.competitions.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:image,:introduction,:is_deleted)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
