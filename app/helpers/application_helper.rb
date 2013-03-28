module ApplicationHelper
	
	def flash_messages
		fl = flash[:notice]
		flash[:notice] = nil
		fl
	end

	def logged_in?
		!@current_user.blank?
	end

end
