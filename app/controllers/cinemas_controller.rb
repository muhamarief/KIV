class CinemasController < ApplicationController

  def index
    @cinemas = Cinema.all
  end

  def show
    @cinema = Cinema.find(params[:id])
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.new(cinema_params)
    @cinemas = Cinema.all
    if @cinema.save
      redirect_to cinema_path(@cinemas)
    else
      render 'new'
    end
  end

  def edit
    @cinema = Cinema.find(params[:id])
  end

  def update
     @cinema = Cinema.find(params[:id])
     @cinemas = Cinema.all
     if @cinema.update(cinema_params)
        redirect_to cinema_path(@cinema)
     else
        render 'edit'
     end
  end

 def destroy
    @cinema = Cinema.find(params[:id])
    @cinema.destroy

    redirect_to root_path
  end


 private
    def cinema_params
      params.require(:cinema).permit(:cinema_name, :contact, :address, :state, :company, :cinema_id, :longitude, :latitude)
    end


end
