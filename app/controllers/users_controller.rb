class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :only_current_user

	def show
		#Regarder dans l'url pour savoir le param demande
		@user =User.find(params[:id])
	end

	def only_current_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless @user == current_user
		end
end
