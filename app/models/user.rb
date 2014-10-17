class User < ActiveRecord::Base
	attr_accessor :password
	#attr_accessible :name, :email, :password, :password_confirmation
	
	validates_format_of :email , :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates :name, :length => {:maximum => 50}
	validates :email, :length => {:within => 5..30}
	validates :password, :confirmation => true

	#callback : ma hoa password
	before_save :encrypted_password

	# so sanh password
	def has_password?(submitted_password)
		encrypted_password == submitted_password
	end

	#check email and submitted_password is valid
	def has_authenticate?(email, submitted_password)
		#get email
		user = find_by_email(email)

		#if email null
		if user.nil
			return nil			
		end
		#if tru when ask has_password
		if user.has_password(submitted_password)
			return user				
		end		
	end

	private 
	def encrypted_password
		# tao ra ma salt khi tao moi mot user
		self.salt = Digest::SHA2.hexdigest("#{Time.now.utc} -- #{password}") if self.new_record?

		self.encrypted_password = encrypted(password)
	end

	# ma hoa pass su dung salt va mat khau da dc truyen qua
	def encrypted(password)
		Digest::SHA2.hexdigest("#{self.salt} -- #{pass}")
	end

end
