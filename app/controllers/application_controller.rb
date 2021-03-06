class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		 user_path(@user.id)
	end
	def after_log_in_path_for(resource)
		user_path(@user.id)
	end
	def after_sign_out_path_for(resource)
		root_path
	end
	def set_current_user
  @current_user = User.find_by(id: session[:user_id])
	end
  protected
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
  end
end
