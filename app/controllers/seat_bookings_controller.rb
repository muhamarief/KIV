class SeatBookingsController < ApplicationController

  def new
  end

  def create
  end

  def edit

  end

  def update

  end
  
  private
  def seat_booking_params
    params.require(:seat_booking).permit(:booking_id, :seat_id)
  end
end
