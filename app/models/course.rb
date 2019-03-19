class Course < ApplicationRecord
	has_many :assignments
	has_many :usercourseactions
  	has_many :users, :through => :usercourseactions
	validates :course_name, presence: true,
						length: {minimum: 8}
end
