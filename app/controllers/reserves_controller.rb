class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
    @rooms = Room.all
  end

  def new 
    @reserve = Reserve.new(params.require(:reserve).permit(:start_day, :end_day, :num_people, :user_id, :room_id))
    @room = Room.find_by(id: @reserve.room_id)
  end

  def create
    @room = Room.find_by(params[:id])
    @reserve = Reserve.new(params.require(:reserve).permit(:start_day, :end_day, :num_people, :user_id, :room_id))
    if @reserve.save
      flash[:notice] = "ルームの予約が完了しました"
      redirect_to :reserves
    else
      flash[:notice] = "ルームの予約が出来ませんでした。"
    end
  end

  def show
    @reserve = Reserve.find(params[:id])
  end
end
