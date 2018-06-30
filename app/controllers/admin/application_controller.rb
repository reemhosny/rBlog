class Admin::ApplicationController < ActionController::Base
	layout 'admin/application'
	protect_from_forgery with: :exception
	helper_method :current_user

	private
	 def current_user
       @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end
 
	def authorize
	    redirect_to admin_login_path unless current_user
	  end

	
end
