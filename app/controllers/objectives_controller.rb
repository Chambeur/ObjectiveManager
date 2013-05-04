class ObjectivesController < ApplicationController
	def new
		@objective = Objective.new
		@project = Project.find(params[:project_id])
		@labels = Label.all
		@profiles = Profile.where(user_id: @project.team.users)
	end

	def create
		@objective = Objective.new(params[:objective])
		@objective.user = User.find(params[:user_id])
		@objective.project = Project.find(params[:project_id])
		@objective.labels = Label.find(params[:label_ids]) unless params[:label_ids] == nil
		@objective.done = false
		@objective.startdate = Date.today

		if @objective.save
			flash[:success] = "Objective created."
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

	def edit
		@objective = Objective.find(params[:id])
		@labels = Label.all
		@users = User.find(@objective.project.team.users)
	end

  def update
    @objective = Objective.find(params[:id])
    user = User.find(params[:user_id])
    labels = Label.find(params[:label_ids]) unless params[:label_ids] == nil
    if @objective.update_attributes(params[:objective], user: user, labels: labels)
      flash[:success] = "All the modifications have been saved."
      redirect_to project_path(@objective.project)
    else
      flash[:error] = "Error while saving the modifications."
      render 'edit'
    end
  end

	def destroy
		objective = Objective.find(params[:id])
		project = objective.project
		objective.destroy

		flash[:info] = "Objective deleted"
		redirect_to project_path(project)
	end

	def done
		@objective = Objective.find(params[:id])

		if @objective.update_attributes(done: true)
			flash[:success] = "Congrats ! Objective done."
			render "show"
		else
			flash[:error] = "Objective not updated."
			render "show"
		end
	end

	def report
		@objective = Objective.find(params[:id])

		if @objective.status.eql?(Status::PENDING)
			startdate = @objective.startdate.next_week

			if @objective.update_attributes(startdate: startdate)
				flash[:info] = "Objective reported next week."
				render "show"
				return
			end
		elsif @objective.status.eql?(Status::MISSED)
			old_objective = @objective
			@objective = Objective.new(old_objective)
			@objective.startdate = Date.today
			if @objective.save
				flash[:info] = "Objective duplicated to this week."
				redirect_to objective_path(@objective)
				return
			end
		else
			# TODO: Ajouter cas d'erreur
			render "show"
			return
		end

		flash[:error] = "Objective not updated."
		render "show"
	end
end
