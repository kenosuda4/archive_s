class Admin::GenresController < ApplicationController
  #管理者ログインしなければ使えない
  before_action :authenticate_admin!
  #特定アクションの重複記述まとめる
  before_action :set_genre, only: [:show, :edit, :update]

  def index
    @genres = Genre.all
    @genre =Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       redirect_to admin_genres_path
    else
      render 'index'
    end
  end

  def show
  end

  def edit
  end

  def update
    if genre.update(genre_params)
       redirect_to admin_genres_path
    else
       render 'index'
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end


end
