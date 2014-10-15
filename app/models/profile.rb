class Profile < ActiveRecord::Base
	has_attached_file :avatar, :styles => {:thumb => "100x100"}
	has_attached_file :resume

end
