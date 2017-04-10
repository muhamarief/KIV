class ShowplacesController < ApplicationController

	def index
		@showplaces = Showplace.all
	end

	def new
		@showplace = Showplace.new
	end

	def create
		@showplace = Showplace.new(showplace_params)
		if @showplace.save
			redirect_to root_path
		else
			render "showplaces/new"
		end
	end

	def edit
		@showplace = Showplace.find(params[:id])
	end

	def update
		@showplace = Showplace.find(params[:id])
		if @showplace.save
			redirect_to root_path
		else
			render "showplaces/edit"
		end
	end

	def destroy
		@showplace = Showplace.find(params[:id])
		if @showplace.destroy
			redirect_to root_path
		else
			redirect_to admin_showplaces_path
		end
	end

	private
  def showplace_params
    params.require(:showplace).permit(:cinema_id, :movie_id, :hall_no)
  end


end
