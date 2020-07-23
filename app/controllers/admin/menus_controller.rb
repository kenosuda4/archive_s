class Admin::MenusController < ApplicationController
  #管理者ログインしなければ使えない
  before_action :authenticate_admin!
  #特定アクションの重複記述まとめる
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
       redirect_to admin_menu_path(@menu)
    else
      render 'edit'
    end
  end

  def destroy
    if @menu.destroy
       redirect_to admin_menus_path
    else
      render 'show'
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :genre_id, :content, :image, :total_distance, :is_valid)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end