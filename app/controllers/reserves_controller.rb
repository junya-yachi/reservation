class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
    @rooms = Room.all
    @user = current_user.image
  end

  def new 
    @reserve = reserve.new
    @user = current_user.image
  end

  def create
    @reserve = Reserve.new(params.require(:reserve).permit(:start_day, :end_day, :num_people))
    if @reserve.after_save
      flash[:notice] = "ルームの予約が完了しました"
      redirect_to :reserf
    end
    @user = current_user.image
  end

  def show
    @reserve = Reserve.find(params[:id])
    @user = current_user.image
  end
end
