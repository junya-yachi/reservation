class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
    @rooms = Room.all
  end

  def new 
    @reserve = reserve.new
  end

  def create
    @reserve = reserve.new(params.require(:reserve).permit(:start_day, :end_day, :num_people))
    if @reserve.after_save
      flash[:notice] = "ルームの予約が完了しました"
      redirect_to :reserf
    end
  end

  def show
    @reserve = Reserve.find(params[:id])
  end
end
