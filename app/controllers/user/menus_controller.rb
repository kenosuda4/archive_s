class User::MenusController < ApplicationController
  #ログインしなければ使えない
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  #特定アクションの重複記述まとめる
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_genres, only: [:edit, :update, :new, :create, :destry]


  def index
    @menus = Menu.where(is_valid: true)
  end

  def new
    @menu = Menu.new
    @user = current_user
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
     if @menu.save
       redirect_to menu_path(@menu)
    else
      render 'new'
    end
  end

  def show
    @user = @menu.user
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
       redirect_to menu_path(@menu)
    else
      render 'edit'
    end
  end

  def destroy
    if @menu.destroy
       redirect_to user_path(current_user)
    else
      render 'show'
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :genre_id, :introduction, :image, :total_distance, :is_valid)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

  def correct_user
    menu = Menu.find(params[:id])
    user = menu.user
    if current_user != user
      redirect_to menus_path
    end
  end

end
