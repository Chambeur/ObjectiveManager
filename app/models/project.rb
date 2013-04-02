class Project < ActiveRecord::Base
	attr_accessible :name, :description

	has_many :objectives, :dependent => :destroy
end
