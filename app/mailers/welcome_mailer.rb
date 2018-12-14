class WelcomeMailer < ApplicationMailer

	def welcome(user, user_name)
		 @user = user
		 @user_name = user_name
		 mail(to: @user.email, subject: "Bienvenido a MejoraApp")
	end

end
