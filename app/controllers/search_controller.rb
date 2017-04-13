class SearchController < ApplicationController

  def index
    if params[:search][:q] == ""
      v = params[:search][:v]
      @cinema = Cinema.find(v.to_i)
      @movies = @cinema.movies
      render :template => "cinemas/show"
    elsif params[:search][:v] == ""
      q = params[:search][:q]
      @movie = Movie.find(q.to_i)
      @screenings = @movie.screenings.group_by(&:showplace_id)
      byebug
      render :template => "movies/show"
    else
      q = params[:search][:q]
      v = params[:search][:v]
      @cinema = Cinema.find(v.to_i)
      @movie = Movie.find(q.to_i)

      # @movie.screenings.group_by(&:showplace_id)
      @showplaces =   @movie.showplaces.where(cinema_id: @cinema.id).group_by(&:id)
      # .group_by(&:showplace_id)
      render :template => "movies/show"
    end

  end

end
