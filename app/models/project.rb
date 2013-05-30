class Project < ActiveRecord::Base
	# Attributes
	attr_accessible :name, :description

	# Associations
	has_many :objectives, dependent: :destroy
	belongs_to :team

	# Validations
	validates :name, :description, :team, presence: true
  validates :name, uniqueness: true
end
