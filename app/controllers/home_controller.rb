class HomeController < ApplicationController

  def index
  	if user_signed_in?
    	@objectives = Objective.sort_by_status(current_user.objectives)
    end
  end
end
