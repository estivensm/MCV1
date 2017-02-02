class SeguimientoMailer < ApplicationMailer
def noty_report(employed , report)
  @employed = employed
  @report = report
  mail(to: @employed.email, subject: "Proximo Seguimiento")
end
end
