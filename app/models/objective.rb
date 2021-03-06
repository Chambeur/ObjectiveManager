class Objective < ActiveRecord::Base
	# Attributes
	attr_accessible :title, :description, :done, :duplicate, :startdate

	# Associations
	belongs_to :user
	belongs_to :project
	has_and_belongs_to_many :labels

	# Validations
	validates :user, :title, :startdate, :project, presence: true
  validates :done, :duplicate, inclusion: {in: [true, false]}

  # Methods
  def status
    if self.done?
      Status::DONE
    elsif self.duplicate
      Status::DUPLICATED
    elsif self.startdate.cweek == Date.today.cweek && self.startdate.cwyear == Date.today.cwyear
      Status::PENDING
    elsif (self.startdate.cwyear > Date.today.cwyear) || (self.startdate.cweek > Date.today.cweek && self.startdate.cwyear == Date.today.cwyear)
      Status::DELAYED
    else
      Status::MISSED
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

  def self.sort_by_status(objectives)
    sort_objectives = objectives.sort_by do |obj|
      case obj.status
      when Status::MISSED
        [1, obj]
      when Status::PENDING
        [2, obj]
      when Status::DELAYED
        [3, obj]
      when Status::DONE
        [4, obj]
      when Status::DUPLICATED
        [5, obj]
      else
        [6, obj]
      end
    end

    return sort_objectives
  end
end
