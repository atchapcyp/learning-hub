class Course < ApplicationRecord
	has_many :assignments
	
	validates :course_name, presence: true,
						length: {minimum: 8}
end
