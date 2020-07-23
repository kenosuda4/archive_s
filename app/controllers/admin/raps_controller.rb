class Admin::RapsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]
  before_action :set_rap, only: [:show, :edit, :update, :destroy]


  def show
    @record = @rap.record
    @user = @rap.user
  end

  def edit
    @record = @rap.record
    @user = @rap.user
  end

  def update
    if @rap.update(rap_params)
      redirect_to admin_record_path(@rap.record)
    else
      render 'edit'
    end
  end

  def destroy
    if @rap.destroy!
      redirect_to admin_record_path(@rap.record)
    else
      redirect_to admin_competitions_path
    end
  end

  private

  def rap_params
    params.require(:rap).permit(:user_id, :record_id, :distance, :name, :rap_time)
  end

  def set_rap
    @rap = Rap.find(params[:id])
  end

end
