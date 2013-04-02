class Objective < ActiveRecord::Base
	attr_accessible :title, :description

	belongs_to :user
	belongs_to :project
	has_and_belongs_to_many :labels

	validates :user, :title, :description, :presence => {:message => "Field cannot be empty."}
end
