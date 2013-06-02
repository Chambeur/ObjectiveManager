class ProfilesController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

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

  def nowadmin
    @user = User.find(params[:id])
    @user.admin = true
    if @user.save
      flash[:success] = "Now admin"
      redirect_to root_path
    else
      flash[:error] = "Error while saving the modifications."
      redirect_to root_path
    end
  end
end
