class ContactNotifier < ActionMailer::Base
  	default :from => 'samuelwaknine@gmail.com'

  	# send a signup email to the user, pass in the user object that   contains the user's email address
  	def send_contact_email(email)
		@email = email

   		mail( :to => email,
   		 :subject => 'Thanks for your comment' )
  	end

  	def send_signup_email(email)
  		@name = name

   		mail( :to => email,
   		 :subject => 'Thanks for your subscription' )
   	end

end
