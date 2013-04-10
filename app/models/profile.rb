class Profile < ActiveRecord::Base
	# Attributes
	attr_accessible :pseudo, :firstname, :lastname, :birthday
	accepts_nested_attributes_for :profile

  # Associations
  belongs_to :user

	# Validations
	validates :pseudo, presence: {message: "Field cannot be empty."}

end
