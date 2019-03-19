class CoursesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def index
		@courses=Course.all
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
		#@course=Course.new(course_params)
		@course = Course.new(course_params)
 		@course.users << User.find(current_user.id)
		if(@course.save)
			#@usercourseaction=Usercourseaction.new(usercourseaction_params)
			redirect_to @course
		else
			render 'new'
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
		@course.destroy
		redirect_to courses_path
	end

	def edit
			@course = Course.find(params[:id])
	end

	private def course_params
		params.require(:course).permit(:course_name,:course_description)
	end


end
