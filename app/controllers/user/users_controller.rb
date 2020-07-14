class User::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update]

  
  def index
    @users = User.where(is_deleted: false).page(params[:page]).reverse_order
  end

  def show
    @h_menus = @user.menus.where(is_valid: true).page(params[:menu]).per(5).reverse_order
    @menus = @user.menus.page(params[:menu]).per(5).reverse_order
    @competitions = @user.competitions.page(params[:competition]).per(5).reverse_order
    @h_competitions = @user.competitions.where(is_valid: true).page(params[:competition]).per(5).reverse_order
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

  def quit
    @user = current_user
    @user.update(is_deleted: true)
    #update後にログアウトしたい。
    sign_out @user
    redirect_to root_path
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
      redirect_to root_path
    end
  end

end
