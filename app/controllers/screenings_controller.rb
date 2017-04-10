class ScreeningsController < ApplicationController

  def new
    @screening = Screening.new
  end

  def create
    @screening = Screening.new(screening_params)
    @screening.showplace_id = Showplace.find(params[:showplace_id]).id
    byebug
    if @screening.save
      redirect_to root_path
    else
      redirect_to admin_showplaces_path
    end
  end

  def index
    @screening = Screening.new
    @screenings = Screening.find_by(:showplace_id => params[:showplace_id])
    @current_showplace = Showplace.find(params[:showplace_id])
  end

  private
  def screening_params
    params.require(:screening).permit(:price, :start_date, :start_time, :showplace_id)
  end

end