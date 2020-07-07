class User::RapsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_rap, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def create
    @rap = Rap.new(rap_params)
    @rap.user_id = current_user.id
    if @rap.save!
       redirect_to rap_path(@rap)
    else
      @competitons = Competition.all
      redirect_to competitons_path
    end
  end

  def show
    @record = @rap.record
    @user = @rap.user
  end

  def edit
    @user = @rap.user
    @records = @user.records.all
  end

  def update
    if @rap.update(rap_params)
      redirect_to rap_path(@rap)
    else
      render 'edit'
    end
  end

  def destroy
    if @rap.destroy
      redirect_to record_path(@record)
    else
      redirect_to competitions_path
    end
  end

  private

  def rap_params
    params.require(:rap).permit(:user_id, :record_id, :distance, :name, :rap_time)
  end

  def set_rap
    @rap = Rap.find(params[:id])
  end

  def correct_user
    rap = Rap.find(params[:id])
    user = rap.user
    if current_user != user
      redirect_to competitions_path
    end
  end



end
