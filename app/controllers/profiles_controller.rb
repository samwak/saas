class ProfilesController < ApplicationController

	def new
		#form where a user can fill their OWN profile
		#recupere le user qui est actuellement log
		@user = User.find(params[:user_id])
		@variable = params[:hello]
		@profile = @user.build_profile
	end


end
