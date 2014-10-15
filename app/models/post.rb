class Post < ActiveRecord::Base
	has_many :comments
	validates_associated :comments
end
