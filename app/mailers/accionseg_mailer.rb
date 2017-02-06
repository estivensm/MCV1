class AccionsegMailer < ApplicationMailer
	def noty_accion(employed , report, tipo)
  @employed = employed
  @report = report
  @tipo = tipo
  mail(to: @employed.email, subject: "Proximo Seguimiento")
end
end
