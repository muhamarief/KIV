class BookingsController < ApplicationController

  def new
  end

  def create
    @booking = Booking.new(screening_id: params[:screening_id], user_id: current_user.id)
    if @booking.save
      seat_ids = params['selected_seats'].split(',')
      seat_ids.each do |seat_id|
        @seat_booking = SeatBooking.new(booking_id: @booking.id, seat_id: seat_id)
        @seat_booking.save
      end
      redirect_to booking_path(@booking)
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @seat_bookings = SeatBooking.where(booking_id: params[:id])
  end

  def index
  end

  private
  def booking_params
    params.require(:booking).permit(:screening_id, :user_id, :paid_status)
  end

  def seat_booking_params
    params.require(:seat_booking).permit(:booking_id, :seat_id)
  end

end
