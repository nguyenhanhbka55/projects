class Book < ActiveRecord::Base
	has_many :authors, order: => 'title DESC', dependent: :destroy
end
