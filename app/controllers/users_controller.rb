class UsersController < ApplicationController

	def show
		#Regarder dans l'url pour savoir le param demande
		@user =User.find(params[:id])
	end
end
