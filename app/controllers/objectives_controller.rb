class ObjectivesController < ApplicationController
	def new
		@objective = Objective.new
		@project = Project.find(params[:project_id])
	end

	def create
		objective = Objective.new(params[:objective])
		objective.user = User.find(params[:user_id])
		objective.project = Project.find(params[:project_id])
		objective.labels = Label.find(params[:label_ids]) unless params[:label_ids] == nil
		objective.status = :pending

		if objective.save
			redirect_to project_path(objective.project)
		else
			flash[:error] = "Error. Your objective has not been saved."
      render "new"
		end
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

		redirect_to project_path(params[:project_id])
	end
end
