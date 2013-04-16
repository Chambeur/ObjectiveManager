class ObjectivesController < ApplicationController
	def new
		@objective = Objective.new
		@objective.project = Project.find(params[:project_id])
	end

	def create
		@objective = Objective.new(params[:objective])
		@objective.user = User.find(params[:user_id])
		@objective.project = Project.find(params[:project_id])
		@objective.labels = Label.find(params[:label_ids]) unless params[:label_ids] == nil
		@objective.done = false
		@objective.week = Date.today.cweek
		@objective.year = Date.today.cwyear

		if @objective.save
			redirect_to project_path(@objective.project)
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
		objective = Objective.find(params[:id])
		project = objective.project
		objective.destroy

		redirect_to project_path(project)
	end

	def done
		@objective = Objective.find(params[:id])

		if @objective.update_attributes(done: true)
			flash[:succes] = "Congrats ! You finish your objective."
			render "show"
		else
			flash[:error] = "Objective not updated."
			render "show"
		end
	end

	def report
		@objective = Objective.find(params[:id])

		if @objective.update_attributes(week: Date.today.cweek, year: Date.today.cwyear)
			flash[:info] = "Objective reported to current week."
			render "show"
		else
			flash[:error] = "Objective not updated."
			render "show"
		end
	end
end
