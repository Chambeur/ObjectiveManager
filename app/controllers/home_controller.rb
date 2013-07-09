class HomeController < ApplicationController

  def index
    @objectives = Objective.sort_by_status(current_user.objectives)
  end
end
