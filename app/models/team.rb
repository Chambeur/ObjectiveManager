class Team < ActiveRecord::Base
	# Attributes
	attr_accessible :name, :autogenerate

	# Associations
	has_many :projects
	has_many :teammembers
	has_many :users, through: :teammembers

	# Validations
	validates :name, presence: {message: "Field cannot be empty."}

	# Methods
	def self.autogenerate (project_name, user_id)
		team = Team.new(name: project_name + ' Team', autogenerate: true)
		if team.save && team.add_teammember(user_id, true)
			team
		else
			nil
		end
	end

	def add_teammember(user_id, manager)
		teammember = Teammember.new
		teammember.team_id = self.id
		teammember.user_id = user_id
		teammember.manager = manager
		teammember.save
	end

end
