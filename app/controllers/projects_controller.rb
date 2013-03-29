class ProjectsController < ApplicationController
	def new 
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
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
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

end
