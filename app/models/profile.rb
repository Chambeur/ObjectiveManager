class Profile < ActiveRecord::Base
	# Attributes
	attr_accessible :pseudo, :firstname, :lastname, :birthday

  # Associations
  belongs_to :user

	# Validations
	validates :pseudo, :user, presence: true
  validates :pseudo, uniqueness: true

  # Methods
  def percent(opts = {})
    period = opts[:period] || Date.today
    opts[:user_id] = self.user_id
    undone_nb = Objective.undone_nb(period, opts)
    done_nb = Objective.done_nb(period, opts)
    total_nb = undone_nb + done_nb

    total_nb.eql?(0) ? total_nb : done_nb * 100 / total_nb
  end
end
