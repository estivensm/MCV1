class WelcomeMailer < ApplicationMailer
	def welcome(user)
  @user = user
 mail(to: @user.email, subject: "Bienvenido a Visualisoft")
end
end
