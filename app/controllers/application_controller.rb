class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	#protect_from_forgery with: :exception
	protect_from_forgery with: :null_session

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :forename
		devise_parameter_sanitizer.for(:sign_up) << :surname
		devise_parameter_sanitizer.for(:sign_up) << :street
		devise_parameter_sanitizer.for(:sign_up) << :city
		devise_parameter_sanitizer.for(:sign_up) << :state
		devise_parameter_sanitizer.for(:sign_up) << :zipcode
		devise_parameter_sanitizer.for(:sign_up) << :country
		devise_parameter_sanitizer.for(:sign_up) << :telephone_number

		devise_parameter_sanitizer.for(:account_update) << :forename
		devise_parameter_sanitizer.for(:account_update) << :surname
		devise_parameter_sanitizer.for(:account_update) << :street
		devise_parameter_sanitizer.for(:account_update) << :city
		devise_parameter_sanitizer.for(:account_update) << :state
		devise_parameter_sanitizer.for(:account_update) << :zipcode
		devise_parameter_sanitizer.for(:account_update) << :country
		devise_parameter_sanitizer.for(:account_update) << :telephone_number
	end
end
