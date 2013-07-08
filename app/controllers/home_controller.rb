class HomeController < ApplicationController

  def index
    @objectives = current_user.objectives.sort_by do |obj|
      case obj.status
      when Status::MISSED
        [1, obj]
      when Status::PENDING
        [2, obj]
      when Status::REPORTED
        [3, obj]
      when Status::DONE
        [4, obj]
      else
        [5, obj]
      end
    end
  end
end
