class User::RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def create
    @competition = Competition.find_by_id(params[:id])
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      redirect_to record_path(@record)
    else
      @competitons = Competition.all
      redirect_to request.referrer 
    end
  end

  def show
    @record = Record.find_by_id(params[:id])
    @competition = @record.competition
    @athletic_event = @record.athletic_event
    @user = @record.user
    @rap = Rap.new
    @raps = @record.raps.all 
  end

  def edit
    @user = current_user
    @competition = @record.competition
  end

  def update
    if @record.update(record_params)
      redirect_to record_path(@record)
    else
      @user = current_user
      @competition = @record.competition
      render 'edit'
    end
  end

  def destroy
    if @record.destroy
      redirect_to competition_path(@record.competition.id)
    else
      redirect_to competitions_path
    end
  end

  private

  def record_params
    params.require(:record).permit(:user_id, :competition_id, :athletic_event_id, :name, :time)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def correct_user
    record = Record.find(params[:id])
    user = record.user
    if current_user != user
      redirect_to root_path
    end
  end


end
