class Admin::RecordsController < ApplicationController

  before_action :set_record, only: [:show, :edit, :update, :destroy]

  def show
    @competition = @record.competition
    @user = @record.user
  end

  def edit
    @user = @record.user
    @competitons = @user.competitions.all
  end

  def update
    if @record.update(record_params)
      redirect_to admin_competition_path(@competition)
    else
      render 'edit'
    end
  end

  def destroy
    if @record.destroy
      redirect_to admin_competition_path(@competition)
    else
      redirect_to admin_competitions_path
    end
  end

  private

  def record_params
    params.require(:record).permit(:user_id, :competition_id, :athletic_event_id, :name, :name, :time)
  end

  def set_record
    @record = Record.find(params[:id])
  end


end
