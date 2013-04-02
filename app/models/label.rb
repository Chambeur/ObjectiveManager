class Label < ActiveRecord::Base
	attr_accessible :name, :colour

	has_and_belongs_to_many :objectives

	validates :name, :colour, :presence => {:message => "Field cannot be empty."}
end
