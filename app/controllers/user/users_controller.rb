class User::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update,]
  
  def index
    @users = Users.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render 'edit'
  end

  private

  def user_params
    params.require(:user).permit(:name,:image,:introduction,:is_deleted)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
