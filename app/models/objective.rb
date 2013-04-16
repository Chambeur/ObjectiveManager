class Objective < ActiveRecord::Base
	# Attributes
	attr_accessible :title, :description, :status, :week, :year, :done

	# Associations
	belongs_to :user
	belongs_to :project
	has_and_belongs_to_many :labels

	# Validations
	validates :user, :title, presence: {message: "Field cannot be empty."}

  # Methods
  def status
    if self.done?
      :done
    elsif self.week == Date.today.cweek && self.year == Date.today.cwyear
      :pending
    else
      :missed
    end
  end
end
