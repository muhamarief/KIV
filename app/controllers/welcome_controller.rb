class WelcomeController < ApplicationController

  def index
    q = params[:q]
    v = params[:v]

    @movies = Movie.search(title_cont: q).result

    @cinemas = Cinema.search(cinema_name_cont: v).result
    @movie = Movie.first
  end

end
