class ReportMailer < ApplicationMailer
	def noty_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Se creo el reporte #{@report.codigo}")
end
end


