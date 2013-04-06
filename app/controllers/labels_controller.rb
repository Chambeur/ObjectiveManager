class LabelsController < ApplicationController

	def new
		@label = Label.new
	end

	def create
		@label = Label.new(params[:label])
		if @label.save
			redirect_to labels_path
		else
			flash[:error] = "Error. Your label has not been saved."
      render "index"
		end
	end

	def index
		@labels = Label.all
	end

	def show
		@label = Label.find(params[:id])
	end

	def destroy
		@label = Label.find(params[:id])
		@label.destroy

		redirect_to labels_path
	end
end
