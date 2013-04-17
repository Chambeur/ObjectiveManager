class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		team = Team.autogenerate(@project.name, current_user.id)

		if team.nil?
			puts 'error in team'
		end

		@project.team = team

		if @project.save
			redirect_to projects_path
		else
			flash[:error] = "Error. Your project has not been saved."
      render "index"
		end
	end

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@objectives = Objective.where(:project_id => params[:id])
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
	  if @project.update_attributes(params[:project])
	    flash[:success] = "All the modifications have been saved."
	    redirect_to project_path(@project)
	  else
	  	flash[:error] = "Error while saving the modifications."
	    render 'edit'
	  end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

end
