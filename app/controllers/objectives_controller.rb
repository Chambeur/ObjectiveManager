class ObjectivesController < ApplicationController
	def new 
		@objective = Objective.new
	end

	def create
		@objective = Objective.new(params[:objective])
		@objective.save

		redirect_to objectives_path
	end

	def index
		@objectives = Objective.all
	end

	def show
		@objective = Objective.find(params[:id])
	end

	def destroy
		@objective = Objective.find(params[:id])
		@objective.destroy

		redirect_to objectives_path
	end
end
