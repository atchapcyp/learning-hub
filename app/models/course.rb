class Course < ApplicationRecord
	has_many :groups
	has_many :assignments
	has_many :usercourseactions
  	has_many :users, :through => :usercourseactions
	validates :course_name, presence: true,
						length: {minimum: 8}

# 	def activate  // just for example
#     self.update(activated: true)
#   end
#   def deactivate
#     self.update(activated: false)
#   end


end
