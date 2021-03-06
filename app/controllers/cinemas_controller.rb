class CinemasController < ApplicationController

  def index
    @q = Cinema.ransack(params[:q])
    if params[:q].nil?
      @cinemas = Cinema.all
    else
      @cinemas = @q.result
    end
  end

  def show
    @cinema = Cinema.find(params[:id])
    @movies = @cinema.movies
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.new(cinema_params)
    if @cinema.save
      redirect_to cinemas_path
    else
      render 'new'
    end
  end

  def edit
    @cinema = Cinema.find(params[:id])
    @showplace = Showplace.new
  end

  def update
     @cinema = Cinema.find(params[:id])
     @cinemas = Cinema.all
     if @cinema.update(cinema_params)
        redirect_to cinemas_path
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
      params.require(:cinema).permit(:cinema_name, :contact, :address, :state, :company, :cinema_id, :longitude, :latitude, {photos:[]}, :q)
    end


end
