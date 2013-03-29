class Objective < ActiveRecord::Base
	attr_accessible :title, :description

	belongs_to :user
	belongs_to :project

	validates :user, :title, :description, :presence => {:message => "Field cannot be empty."}
end
