class AccionsegMailer < ApplicationMailer
	def noty_accion(employed , accion, tipo)
  @employed = employed
  @accion = accion
  @tipo = tipo
  mail(to: @employed.email, subject: "Proximo Seguimiento")
end
end
