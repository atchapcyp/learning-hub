class CoursesController < ApplicationController
	def index
		@courses=Course.all
	end

	def new 
		@course =Course.new
	end
	def show
		@course=Course.find(params[:id])	
	end

	def create
		#render plain: params[:course].inspect // just for show 
		@course=Course.new(course_params)
		if(@course.save)
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
