class ObjectivesController < ApplicationController
	def new 
		@objective = Objective.new
		@project = Project.find(params[:project_id])
	end

	def create
		@objective = Objective.new(params[:objective])
		user_id = params[:user_id]
		@user = User.find(user_id)
		@objective.user = @user
		@project = Project.find(params[:project_id])
		@objective.project = @project
		if @objective.save
			redirect_to project_path(@project)
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

		redirect_to objectives_path
	end
end
