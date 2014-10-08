class User < ActiveRecord::Base
	validates :login,
            presence: true

	validates :email,
            presence: true,
            format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
    before_save :downcase_email

    private
    def downcase_email
    	self.email = self.email.downcase
  	end
end
