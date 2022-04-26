class ReservationsController < ApplicationController
before_action :authenticate_user!
before_action :set_q
  def index
    # @registrations = Registration.all
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new(params.require(:reservation).permit(:reservation_start_day,:reservation_end_day ,:people,:total_price, :room_id))
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:reservation_start_day,:reservation_end_day ,:people,:total_price, :room_id))
    if @reservation.save
      # binding.pry
      flash[:notice] = "部屋を予約しました"
      redirect_to :root
    else
      # binding.pry
      flash[:notice] = "ルーム登録ができませんでした"
      render "new"
    end
  end
end
