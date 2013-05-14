class Objective < ActiveRecord::Base
	# Attributes
	attr_accessible :title, :description, :done, :startdate

	# Associations
	belongs_to :user
	belongs_to :project
	has_and_belongs_to_many :labels

	# Validations
	validates :user, :title, :done, :startdate, :project, presence: {message: "Field cannot be empty."}

  # Methods
  def status
    if self.done?
      Status::DONE
    elsif self.startdate.cweek >= Date.today.cweek && self.startdate.cwyear >= Date.today.cwyear
      Status::PENDING
    else
      Status::MISSED
    end
  end

  def self.pending_nb(user_id = current_user.id, period = Date.today, project_id = nil)
    if project_id.nil?
      pending_nb = Objective.where(
        done: false,
        user_id: user_id,
        startdate: (period.beginning_of_week..period.end_of_week)
      ).count
    else
      pending_nb = Objective.where(
        done: false,
        project_id: project_id,
        user_id: user_id,
        startdate: (period.beginning_of_week..period.end_of_week)
      ).count
    end
  end

  def self.undone_nb(period, options = {})
    obj_params = {
      done: false,
      startdate: (period.beginning_of_week..period.end_of_week)
    }
    obj_params[:project_id] = options[:project_id] unless options[:project_id].nil?
    obj_params[:user_id] = options[:user_id] unless options[:user_id].nil?

    Objective.where(obj_params).count
  end

  def self.done_nb(period, options = {})
    obj_params = {
      done: true,
      startdate: (period.beginning_of_week..period.end_of_week)
    }
    obj_params[:project_id] = options[:project_id] unless options[:project_id].nil?
    obj_params[:user_id] = options[:user_id] unless options[:user_id].nil?

    Objective.where(obj_params).count
  end
end
