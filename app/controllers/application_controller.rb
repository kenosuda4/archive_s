class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# whenの後、小文字だとnomethod error起きる
	def after_sign_in_path_for(resource)
		case resource
		when User
		  user_path(@user)
		when Admin
		  root_path
		end
	end
	
	# こっちは小文字でもいける
	def after_sign_out_path_for(resource)
		case resource
		when :user
		  root_path
		when :admin
		  new_admin_session_path
		end
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	end
end