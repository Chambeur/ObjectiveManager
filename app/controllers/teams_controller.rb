class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		@managers = Teammember.where(team_id: @team.id, manager: true)
	end

	def destroy
		team = Team.find(params[:id])
		team.destroy

		redirect_to teams_path
	end
end
