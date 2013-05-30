class Teammember < ActiveRecord::Base
	# Attributes
	attr_accessible :manager

	# Associations
	belongs_to :user
	belongs_to :team

  # Validations
  validates :user, :team, presence: true
  validates :manager, inclusion: {in: [true, false]}

end
