class WelcomeController < ApplicationController

  def index
    @q = Cinema.ransack(params[:q])
  end
  
end
