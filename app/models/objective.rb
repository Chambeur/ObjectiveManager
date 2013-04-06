class Objective < ActiveRecord::Base
	# Attributes
	attr_accessible :title, :description, :status

	# Associations
	belongs_to :user
	belongs_to :project
	has_and_belongs_to_many :labels

	# Validations
	validates :user, :title, :description, presence: {message: "Field cannot be empty."}
end
