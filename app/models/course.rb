class Course < ApplicationRecord
	validates :course_name, presence: true,
						length: {minimum: 8}
end
