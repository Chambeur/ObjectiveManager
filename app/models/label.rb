class Label < ActiveRecord::Base
	# Attributes
	attr_accessible :name, :colour

	# Associations
	has_and_belongs_to_many :objectives

	# Validations
	validates :name, :colour, presence: true
end
