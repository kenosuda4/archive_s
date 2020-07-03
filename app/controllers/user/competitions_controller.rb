class User::CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all 
  end

  def new
    @competition = Competition.new
    @user = current_user
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.user_id = current_user.id
     if @competition.save
       redirect_to competition_path(@competition)
    else
      render 'new'
    end
  end

  def show
    @user = @competition.user
    @records = @competition.records.all
    @athletic_events = AthleticEvent.all
    @record = Record.new
  end

  def edit
  end

  def update
    if @competition.update(competition_params)
       redirect_to competition_path(@competition)
    else
      render 'show'
    end
  end

  def destroy
    if @competition.destroy
       redirect_to competitions_path
    else
      render 'index'
    end
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :genre_id, :summary, :is_valid)
  end
  
  def set_competition
    @competition = Competition.find(params[:id])
  end


end
