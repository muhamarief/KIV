class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movies = Movie.all
    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end
  
  def index
    @movies = Movie.all
  end

  def coming_soon
    @movies = Movie.where("release_date < ?", Date.today)
    render "index"
  end

  def showing_now
    @movies = Movie.where("release_date >= ?", Date.today)
    render "index"
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movies = Movie.all
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to root_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description, :genre, :trailer_url, :cast, :rating, :duration, :release_date, {photos: []})
  end

end
