class TaskMailer < ApplicationMailer
	def noty_task(employed , task, tipo)
  @employed = employed
  @accion = task
  @tipo = tipo
  mail(to: @employed.email, subject: "Alerta de Vencimiento")
end
end
