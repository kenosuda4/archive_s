class User::MenusController < ApplicationController
  #ログインしなければ使えない
  before_action :authenticate_user!
  #特定アクションの重複記述まとめる
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_genres, only: [:edit, :update, :new, :index, :create, :destry]


  def index
    @menus = Menu.all
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
    if menu.destroy
       redirect_to user_menus_path
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

end
