class Product < ActiveRecord::Base
	
	validates :name, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  	}

  	def self.search(name)
  		#if search
  		Product.find(:all, :conditions => ['name LIKE ?', "%#{params[:name]}%"])
  		#where('name LIKE ?',"%#{name}%")
  		#else  
  			#find(:all)
  		#end
  	end

end
