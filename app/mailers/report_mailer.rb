class ReportMailer < ApplicationMailer
	def noty_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Los productos top de ayer")
end
end


