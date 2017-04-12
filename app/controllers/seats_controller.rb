class SeatsController < ApplicationController
  layout 'seats', only: [:index]

  def new
  end

  def create
  end

  def index
    @screening = Screening.find(params[:screening_id])
    @seats_hash = @screening.seats.group_by(&:row_number)
    @booking = Booking.new
    @booking_seat = SeatBooking.new
    render "seats/odd_index.html.erb"
  end

  private
  def seat_params
    params.require(:seat).permit(:row_number, :seat_number, :booking_status, :booking_id, :screening_id)
  end
end
