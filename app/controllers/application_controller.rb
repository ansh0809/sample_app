class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_last_seen
  helper_method :current_user
  helper_method :update_last_seen  

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def update_last_seen
		if current_user
			current_user.update_attribute(:last_seen , DateTime.now)
		end
	end
end
