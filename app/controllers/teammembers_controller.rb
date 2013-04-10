class TeammembersController < ApplicationController

	def index
		@team = Team.find(params[:team_id])
		@teammembers = Teammember.where(team_id: @team.id)
	end

	def destroy
		teammember = Teammember.find(params[:id])
		if teammember.manager?
			flash[:info] = "You cannot delete a manager."
		else
			teammember.destroy
		end

		redirect_to team_teammembers_path(params[:team_id])
	end
end
