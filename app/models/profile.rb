class Profile < ActiveRecord::Base
	# Attributes
	attr_accessible :pseudo, :firstname, :lastname, :birthday

  # Associations
  belongs_to :user

	# Validations
	validates :pseudo, presence: {message: "Field cannot be empty."}

  # Methods
  def proj_percent(project_id)

  end

  def percent
    pending_nb = Objective.where(
      done: true,
      user_id: self.user.id,
      week: Date.today.cweek,
      year: Date.today.cwyear
    ).count

    total_nb = Objective.where(
      user_id: self.user.id,
      week: Date.today.cweek,
      year: Date.today.cwyear
    ).count

    average = (pending_nb.to_f / total_nb.to_f) * 100
  end
end
