class CoursePolicy < ApplicationPolicy
    def destroy?
        course.users[0].id == user.id
    end
end