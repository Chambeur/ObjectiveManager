class Teammember < ActiveRecord::Base
	# Attributes
	attr_accessible :manager

	# Associations
	belongs_to :user
	belongs_to :team
end
