class SeatsController < ApplicationController
  layout 'seats', only: [:index]

  def new
  end

  def create
  end

  def index
    @screening = Screening.find(params[:screening_id])
    @seats = @screening.seats
    render "seats/odd_index.html.erb"
    # if @screening.hall_no.odd?
    #   render "seats/odd_index.html.erb", layout: 'seats'
    # elsif @screening.hall_no.even?
    #   render "seats/even_index.html.erb", layout: 'seats'
    # end
  end

  private
  def seat_params
    params.require(:seat).permit(:row_number, :seat_number, :booking_status, :booking_id, :screening_id)
  end
end
