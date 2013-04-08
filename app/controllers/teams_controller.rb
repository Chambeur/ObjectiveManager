class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

	def destroy
		team = Team.find(params[:id])
		team.destroy

		redirect_to teams_path
	end
end
