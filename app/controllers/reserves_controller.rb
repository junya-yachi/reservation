class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
    @rooms = Room.all
  end

  def new 
    @reserve = Reserve.new(reserve_params)
    @room = Room.find_by(id: @reserve.room_id)
  end
 
  def create
    @room = Room.find_by(params[:id])
    @reserve = Reserve.new(reserve_params)
    if @reserve.save
      flash[:notice] = "ルームの予約が完了しました"
      redirect_to :reserves
    else
      flash[:notice] = "ルームの予約が出来ませんでした。"
      render "new"
    end
  end

  def show
    @reserve = Reserve.find(params[:id])
    @room = @reserve.room
    @users = @room.user
  end

  private

  def reserve_params
    params.require(:reserve).permit(:start_day, :end_day, :num_people, :user_id, :room_id)
  end
end
