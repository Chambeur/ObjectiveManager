class Team < ActiveRecord::Base
	# Attributes
	attr_accessible :name, :autogenerate

	# Associations
	has_many :projects

	# Methods
	def self.autogenerate (project_name)
		team = Team.new(name: project_name + ' Team', autogenerate: true)
		if team.save
			team
		else
			nil
		end
	end

	# Validations
	validates :name, presence: {message: "Field cannot be empty."}

end
