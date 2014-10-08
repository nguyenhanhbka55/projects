class Author < ActiveRecord::Base
	belongs_to :book, touch: true
end
