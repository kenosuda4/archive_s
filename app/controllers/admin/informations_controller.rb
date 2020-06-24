class Admin::InformationsController < ApplicationController
  #管理者ログインしなければ使えない
  before_action :authenticate_admin!
  #特定アクションの重複記述まとめる
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  
  def index
    @informations = Information.all
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to admin_information_path(@information)
    else
      render 'index'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @information.update(information_params)
      redirect_to admin_information_path(@information)
    else
      render 'index'
    end
  end

  def destroy
    @information.destroy
    redirect_to admin_informations_path	
  end

  private

  def information_params
    params.require(:information).permit(:title, :info_content, :is_valid)
  end

  def set_information
    @information = Information.find(params[:id])
  end


end
