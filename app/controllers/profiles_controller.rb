class ProfilesController < ApplicationController

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
	  if @profile.update_attributes(params[:profile])
	    flash[:success] = "All the modifications have been saved."
	    redirect_to root_path
	  else
	  	flash[:error] = "Error while saving the modifications."
	    render 'edit'
	  end
	end
end
