class Admin::RecordsController < ApplicationController
  #管理者ログインしなければ使えない
  before_action :authenticate_admin!
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  def show
    @competition = @record.competition
    @athletic_event = @record.athletic_event
    @user = @record.user
    @raps = @record.raps.all
  end

  def edit
    @user = @record.user
    @competition = @record.competition
  end

  def update
    if @record.update(record_params)
      redirect_to admin_record_path(@record)
    else
      render 'edit'
    end
  end

  def destroy
    if @record.destroy
      redirect_to admin_competition_path(@record.competition)
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
