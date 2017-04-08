class SearchController < ApplicationController

  def index
    if params[:q] == ""
      v = params[:v]
      @cinemas = Cinema.search(cinema_name_cont: v).result
      render :template => "cinemas/index"
    elsif params[:v] == ""
      q = params[:q]
      @movies = Movie.search(title_cont: q).result
      render :template => "movies/index"
    else
      q = params[:q]
      v = params[:v]
      @cinema = Cinema.search(cinema_name_cont: v).result.first
      @movie = Movie.search(title_cont: q).result.first
      render :template => "movies/show"
    end
    
  end

end
