class ApplicationController < ActionController::Base

	protect_from_forgery

	before_filter :set_current_user

	def set_current_user
		@current_user ||= login_from_session
	end

	def login_from_session 
		begin
			u = User.find(session[:user_id])
		rescue
			@current_user = nil
			session[:user_id] = nil
			return nil
		end
	end
	
	def login_required 
		if @current_user.blank?
			flash[:notice] = "forbidden."
			redirect_to login_path
		end
	end

	def notify_error(_obj)
		@error_obj = _obj
		render :template => "/main/error"
	end

end
