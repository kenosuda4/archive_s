class Admin::CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitons = Competitions.all 
  end

  def new
    @competiton = Competition.new
  end

  def create
    @cometiton = Competition.new(competiton_params)
    if @competiton.save
      redirect_to competiton_path(@competition)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @competiton = Competition.update(competiton_params)
       redirect_to competitions_path
    else
      render 'show'
    end
  end

  def destroy
    if @competiton.destroy
       redirect_to admin_competitions_path
    else
      render 'index'
  end

  private

  def competiton_params
    params.require(:competiton).permit(:name, :genre_id, :day, :summary, :is_valid)
  end
  
  def set_competition
    @competiton = Competition.find(params[:id])
  end


end
