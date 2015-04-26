class ProfilesController < ApplicationController

	def new
		#form where a user can fill their OWN profile
		#recupere le user qui est actuellement log
		@user = User.find(params[:user_id])
		@profile = @user.build_profile
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.build_profile(profile_params)
		#SI le profile est save correctement on redirige vers la page de show profile
		if @profile.save
			flash[:success] = "Profile Updated"
			redirect_to user_path(params[:user_id])
			#Si non on fait un new
		else
			render action: :new
		end

	end

	private
		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)


		end


end
