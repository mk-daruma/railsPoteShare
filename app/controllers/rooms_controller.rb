class RoomsController < ApplicationController
before_action :authenticate_user! ,only:[:new, :create]
before_action :set_q
  def index
  end

  def new
    @room = Room.new
    # binding.pry
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :room_image).merge(user_id:current_user.id))
    if @room.save
      # binding.pry
      flash[:notice] = "ルームを登録しました"
      redirect_to :root
    else
      # binding.pry
      flash[:notice] = "ルーム登録ができませんでした"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservations = @room.reservations
  end

  def posts
    @rooms = @user.rooms
    # binding.pry
  end

  def search
    @results = @q.result
  end
end
