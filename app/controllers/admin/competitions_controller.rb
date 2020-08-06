class Admin::CompetitionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all
    @users = User.all
  end

  def show
    @user = @competition.user
    @records = @competition.records.all
    @athletic_events = AthleticEvent.all
  end

  def edit
  end

  def update
    if @competition.update(competition_params)
       redirect_to admin_competition_path(@competition)
    else
      render 'show'
    end
  end

  def destroy
    if @competition.destroy
       redirect_to admin_competitions_path
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