class ProfilesController < ApplicationController
	# On ne peut pas acceder a aucune des pages du profiles si on est pas connecte comme le user en question
before_action :authenticate_user!
before_action :only_current_user

	def new
		#form where a user can fill their OWN profile
		#recupere le user qui est actuellement log
		@user = User.find(params[:user_id])
		@profile = Profile.new
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

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end


	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile

		if @profile.update_attributes(profile_params)
			flash[:success] = 'Profile Updated'
			redirect_to user_path(params[:user_id])
		else
			render action: :edit
		end
	end

	private
		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
		end

		def only_current_user
			@user = User.find(params[:user_id])
			redirect_to(root_url) unless @user == current_user
		end


end
