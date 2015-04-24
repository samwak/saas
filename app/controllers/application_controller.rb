class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# on modifie le comportement de devise

before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  	def configure_permitted_parameters
  		devise_parameters_sanitizier.for(:sign_up) { 
  			|u| u.permit(:name, :stripe_card_token, :email, :password, :password_configartion)
  		}
  	end
end
