class Search < ActiveRecord::Base
	validates :name, :email , presence: true
	def search(query)
		where("name LIKE ?", "#{query}")
	end
end
