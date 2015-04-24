class ContactNotifier < ActionMailer::Base
  	default :from => 'samuelwaknine@gmail.com'

  	# send a signup email to the user, pass in the user object that   contains the user's email address
  	def send_signup_email(name, email, body)
   		@name = name
		@email = email
		@body = body

   		mail( :to => email,
   		 :subject => 'Thanks for signing up for our amazing app' )
  	end

end
