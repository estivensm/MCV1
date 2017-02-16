class ReportMailer < ApplicationMailer
	def noty_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Se creo el reporte #{@report.codigo}")
end
def noty_accion(employed , accion)
  @employed = employed
  @accion = accion
  mail(to: @employed.email, subject: "Se creo la accion #{@accion.codigo}")
end
end


