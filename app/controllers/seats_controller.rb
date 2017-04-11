class SeatsController < ApplicationController

  def new
  end

  def create
  end

  def index
  end
  
  private
  def seat_params
    params.require(:seat).permit(:row_number, :seat_number, :booking_status, :booking_id, :screening_id)
  end
end
