class CoursesController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	def index
		@courses=Course.all
		@courses_user=Course.joins(usercourseactions: :user,usercourseactions: :course)
		@usercourseactions=Usercourseaction.joins(:user, :course)
		
	end

	def new 
		@course =Course.new
		@user=User.find(current_user.id)
	end

	def show
		@course=Course.find(params[:id])
		@user=User.find(current_user.id)
	end

	def create
		#render plain: params[:course].inspect // just for show 

		course = Course.new(course_params)
 		course.users << User.find(current_user.id)
 		
		if(course.save)
			if (!current_user.instructor_id.nil?)
			course.usercourseactions.update(status: 'Create')
			
		else
			course.usercourseactions.update(status: 'Subscribe')
		end
			redirect_to course
		else
			render 'new'
		end	
	end

	def subscribe
		course = Course.find(params[:format])
		course.users << User.find(current_user.id)
		if(course.save)
			if (!current_user.instructor_id.nil?)
			course.usercourseactions.update(status: 'Create')
			else
			course.usercourseactions.update(status: 'Subscribe')
			end
			redirect_to home_path
		else
			redirect_to home_path
		end
	end

	def update 
		@course = Course.find(params[:id])

		if(@course.update(course_params))
			redirect_to @course
		else
			render 'edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
		authorize @course #pundit
		@course.destroy #pundit
		redirect_to courses_path
	end

	rescue_from Pundit::NotAuthorizedError, with: :user_not_allow
	private def user_not_allow
		flash[:warning] = "You are not allow to delete this course"
		redirect_to home_path
	end

	def edit
			@course = Course.find(params[:id])
	end

	private def course_params
		params.require(:course).permit(:course_name,:course_description)
	end

	private def course_sub_params
		params.require(:course).permit(:course_name,:course_description)
	end

end
