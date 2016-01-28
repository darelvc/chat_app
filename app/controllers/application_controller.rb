class ApplicationController < ActionController::Base
	after_filter :user_activity
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :name
	  devise_parameter_sanitizer.for(:account_update) << :name
	end
	
	private
	
	
	def user_activity
  	current_user.try :touch
	end
end
