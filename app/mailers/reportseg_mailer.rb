class ReportsegMailer < ApplicationMailer
def noty_report(employed , report,tipo)
  @employed = employed
  @report = report
  @tipo =tipo
  mail(to: @employed.email, subject: "Proximo Seguimiento")
end
end
