class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :rent, :adress, :image, :users_id))
    if @room.save
      flash[:notice] = "ルームの新規登録が完了しました"
      redirect_to :rooms #showアクションページに飛ぶ様にする
    else
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reserve = Reserve.new
  end

end
