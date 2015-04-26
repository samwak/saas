class Users::RegistrationsController < Devise::RegistrationsController

before_filter :select_plan, only: :new



	def create
		@user = User.new(user_params)
		email = params[:user][:email]

		super do |resource|
			if params[:plan]
				resource.plan_id = params[:plan]
				if resource.plan_id == 2
					resource.save_with_payment
				else
					resource.save
				end
			end

			if @contact.save
				ContactNotifier.send_signup_email(email).deliver
			end

		end
	end	


#Gere les cas ou lutilisateur tape dans lurl un autre id de plan
private
	def select_plan
	    unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
	      flash[:notice] = "Please select a membership plan to sign up."
	      redirect_to root_url
	    end
	end

private
	def user_params
		params.require(:user).permit(:email, :encrypted_password)
	end 



end