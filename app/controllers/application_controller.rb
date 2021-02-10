class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	skip_before_action :authenticate_user!, :only => [:index]

	def after_sign_in_path_for(resource)
  		home_demo_path
	end

	rescue_from CanCan::AccessDenied do |exception|
	    redirect_to main_app.root_path, alert: exception.message
	end
end
