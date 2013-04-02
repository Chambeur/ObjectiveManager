class Project < ActiveRecord::Base
	attr_accessible :name, :description

	has_many :objectives, :dependent => :destroy

	validates :name, :description, :presence => {:message => "Field cannot be empty."}
end
