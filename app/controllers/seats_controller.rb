class SeatsController < ApplicationController

  def new
  end

  def create
  end

  def index
    @screening = Screening.find(params[:screening_id])
    @seats = @screening.seats
    if @screening.hall_no.odd?
      render "seats/odd_index.html.erb"
    elsif @screening.hall_no.even?
      render "seats/even_index.html.erb"
    end
  end

  private
  def seat_params
    params.require(:seat).permit(:row_number, :seat_number, :booking_status, :booking_id, :screening_id)
  end
end
