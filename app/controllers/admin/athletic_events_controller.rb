class Admin::AthleticEventsController < ApplicationController
  #管理者ログインしなければ使えない
  before_action :authenticate_admin!
  #特定アクションの重複記述まとめる
  before_action :set_athletic_events, only: [:show, :edit, :update]
  
  def index
    @athletic_events =AthleticEvent.all
    @athletic_event = AthleticEvent.new
  end

  def create
    @athletic_event = AthleticEvent.new(athletic_event_params)
    if @athletic_event.save
       redirect_to admin_athletic_events_path
    else
       render 'index'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @athletic_event.update(athletic_event_params)
       redirect_to admin_athletic_events_path
    else
       render 'index'
    end
  end

    private
    def athletic_event_params
      params.require(:athletic_event).permit(:name)
    end
    def set_athletic_events
      @athletic_event = AthleticEvent.find(params[:id])
    end
end
