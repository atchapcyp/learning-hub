class MycoursesController < ApplicationController

	before_action :authenticate_user!

  def index
    @courses = current_user.courses.all
  end

	def mycourses
		@title ='My Course'
		@user_subscribe='Subscribed Course'
	end


end
