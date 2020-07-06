class User::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update,]

  
  def index
    @users = User.all
  end

  def show
    @h_menus = @user.menus.where(is_valid: true)
    @menus = @user.menus.all
    @competitions = @user.competitions.all
    @h_competitions = @user.competitions.where(is_valid: true)
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


  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end

end
