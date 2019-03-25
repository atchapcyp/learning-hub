class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password,:citizen_id,:first_name,:last_name,:student_id,:instructor_id,:department_name,:user_type) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :password, :current_password,:first_name,:last_name,:student_id,:instructor_id,:department_name,:user_type) }
        end
end
